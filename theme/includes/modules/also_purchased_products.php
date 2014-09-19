<?php

  if (isset($HTTP_GET_VARS['products_id'])) {
    $orders_query = tep_db_query("select p.products_id, p.products_image from " . TABLE_ORDERS_PRODUCTS . " opa, " . TABLE_ORDERS_PRODUCTS . " opb, " . TABLE_ORDERS . " o, " . TABLE_PRODUCTS . " p where opa.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and opa.orders_id = opb.orders_id and opb.products_id != '" . (int)$HTTP_GET_VARS['products_id'] . "' and opb.products_id = p.products_id and opb.orders_id = o.orders_id and p.products_status = '1' group by p.products_id order by o.date_purchased desc limit " . MAX_DISPLAY_ALSO_PURCHASED);
    $num_products_ordered = tep_db_num_rows($orders_query);
    if ($num_products_ordered >= MIN_DISPLAY_ALSO_PURCHASED) {
      $counter = 0;
      $col = 0;

      $also_pur_prods_content = '<ul class="row productSlider">';
      while ($orders = tep_db_fetch_array($orders_query)) {
        $counter++;

        $orders['products_name'] = tep_get_products_name($orders['products_id']);

       	$also_pur_prods_content .= '<li class="col-xs-3"><div class="product-container">';

        $also_pur_prods_content .= 
			'<div class="product-image-box">'.
			'	<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $orders['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $orders['products_image'], $orders['products_name'], ALSOPURCHASED_IMAGE_WIDTH, ALSOPURCHASED_IMAGE_HEIGHT, '', '') . '</a>'.
			'</div>'.
			'	<a class="product-name" href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $orders['products_id']) . '">' . $orders['products_name'] . '</a>';

   		  $col ++;
          $also_pur_prods_content .= '</div></li>';
      }

      $also_pur_prods_content .= '</ul>';
	  $also_pur_prods_content .= '
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
			prevText:"",
			nextText:""
		});
	  </script>';
?>

<div class="module purchased-box">
  <h3 class="module-heading"><?php echo TEXT_ALSO_PURCHASED_PRODUCTS; ?></h3>
  <div class="block-content"><?php echo $also_pur_prods_content; ?></div>
</div>
<?php
    }
  }
?>
