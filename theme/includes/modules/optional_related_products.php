<?php

  $orderBy = 'ORDER BY ';
  $orderBy .= (RELATED_PRODUCTS_RANDOMIZE)?'rand()':'pop_order_id, pop_id';
  $orderBy .= (RELATED_PRODUCTS_MAX_DISP)?' limit ' . RELATED_PRODUCTS_MAX_DISP:'';
  $attributes = tep_db_query("
         SELECT
         pop_products_id_slave,
         products_name,
         products_model,
         products_price,
         products_quantity,
         products_tax_class_id,
         products_image
         FROM " .
         TABLE_PRODUCTS_RELATED_PRODUCTS . ", " .
         TABLE_PRODUCTS_DESCRIPTION . " pa, ".
         TABLE_PRODUCTS . " pb
         WHERE pop_products_id_slave = pa.products_id
         AND pa.products_id = pb.products_id
         AND language_id = '" . (int)$languages_id . "'
         AND pop_products_id_master = '".$HTTP_GET_VARS['products_id']."'
         AND products_status='1' " . $orderBy);
  $attribute_query = $attributes;
  $num_related = tep_db_num_rows($attribute_query);

  if ($num_related > 0) {
  $count = 0;
?>
    <div class="module related-product">
    	 <h3 class="module-heading"><?php echo TEXT_RELATED_PRODUCTS ?> </h3>
         <div class="block-content">
        <ul class="row productSlider">
<?php
    while ($attributes_values = tep_db_fetch_array($attribute_query)) {
      $products_name_slave = ($attributes_values['products_name']);
      $products_model_slave = ($attributes_values['products_model']);
      $products_qty_slave = ($attributes_values['products_quantity']);
      $products_id_slave = ($attributes_values['pop_products_id_slave']);
      if ($new_price = tep_get_products_special_price($products_id_slave)) {
        $products_price_slave = $currencies->display_price($new_price, tep_get_tax_rate($attributes_values['products_tax_class_id']));
      } else {
        $products_price_slave = $currencies->display_price($attributes_values['products_price'], tep_get_tax_rate($attributes_values['products_tax_class_id']));
      }
      echo '<li class="col-xs-3"><div class="product-container">';
      // show thumb image if Enabled
      if (RELATED_PRODUCTS_SHOW_THUMBS == 'True') {
        echo 
			'	<div class="product-image-box">'.
			'		<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $products_id_slave) . '">'. tep_image(DIR_WS_IMAGES . $attributes_values['products_image'], $attributes_values['products_name'], ALSOPURCHASED_IMAGE_WIDTH, ALSOPURCHASED_IMAGE_HEIGHT, '').'</a>'.
			'	</div>';
      }
      $caption = '';
      if (RELATED_PRODUCTS_SHOW_NAME == 'True') {
        $caption .= '<div class="related-row product-name-box">' . '<a class="product-name" href="'. tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $products_id_slave) . '">'.$products_name_slave;
        if (RELATED_PRODUCTS_SHOW_MODEL == 'True') {
          $caption .= sprintf(RELATED_PRODUCTS_MODEL_COMBO, $products_model_slave);
        }
        $caption .= '</a></div>';
      } elseif (RELATED_PRODUCTS_SHOW_MODEL == 'True') {
        $caption .=  '<div class="related-row product-model-box">' . $products_model_slave . '</div>';
      }
      if (RELATED_PRODUCTS_SHOW_PRICE == 'True') {
        $caption .= '<div class="related-row price-box">' . sprintf(RELATED_PRODUCTS_PRICE_TEXT, $products_price_slave) . '</div>';
      }
      if (RELATED_PRODUCTS_SHOW_QUANTITY == 'True') {
        $caption .= '<div class="related-row quantity-box">' . sprintf(RELATED_PRODUCTS_QUANTITY_TEXT, $products_qty_slave) . '</div>';
      }
      echo  $caption;
      if (RELATED_PRODUCTS_SHOW_BUY_NOW== 'True') {
        echo '<div class="related-row button-box"><a class="btn btn-primary" href="'. tep_href_link(basename($PHP_SELF), tep_get_all_get_params(array('action')). 'action=rp_buy_now&rp_products_id=' . $products_id_slave) . '">'. IMAGE_BUTTON_RP_BUY_NOW . '</a></div>';
      }
      echo '</div></li>';
      $count++;
    }
?>
        </ul>
        <script type="text/jscript">
	  	$(".productSlider").bxSlider({
			minSlides: 4,
			maxSlides: 4,
			slideWidth: 202,
			slideMargin: 20,
			moveSlides: 1,
			pager: false,
			infiniteLoop: false,
			hideControlOnEnd: true,
			responsive:false,
			controls:true,
			prevText:'',
			nextText:''
		});
	  </script>
        </div>
    </div>
<?php
}
?>
