<?php

  if ( (!isset($new_products_category_id)) || ($new_products_category_id == '0') ) {
    $new_products_query = tep_db_query("select p.products_id, p.products_image, p.products_tax_class_id, pd.products_name, if(s.status, s.specials_new_products_price, NULL) as specials_new_products_price, products_price from " . TABLE_PRODUCTS . " p left join " . TABLE_SPECIALS . " s on p.products_id = s.products_id, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' order by p.products_date_added desc limit " . MAX_DISPLAY_NEW_PRODUCTS);
  } else {
    $new_products_query = tep_db_query("select distinct p.products_id, p.products_image, p.products_tax_class_id, pd.products_name, if(s.status, s.specials_new_products_price, NULL) as specials_new_products_price, products_price from " . TABLE_PRODUCTS . " p left join " . TABLE_SPECIALS . " s on p.products_id = s.products_id, " . TABLE_PRODUCTS_DESCRIPTION . " pd, " . TABLE_PRODUCTS_TO_CATEGORIES . " p2c, " . TABLE_CATEGORIES . " c where p.products_id = p2c.products_id and p2c.categories_id = c.categories_id and c.parent_id = '" . (int)$new_products_category_id . "' and p.products_status = '1' and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' order by p.products_date_added desc limit " . MAX_DISPLAY_NEW_PRODUCTS);
  }

  $num_new_products = tep_db_num_rows($new_products_query);

  if ($num_new_products > 0) {
	$i = 0;
    $new_prods_content = '<ul class="row product-listing grid">';
    while ($new_products = tep_db_fetch_array($new_products_query)) {
		$i++;
		$product_query = tep_db_query("select products_description, products_id from " . TABLE_PRODUCTS_DESCRIPTION . " where products_id = '" . (int)$new_products['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
    	$product = tep_db_fetch_array($product_query);
		
		if (tep_not_null($new_products['specials_new_products_price'])) {
			$products_price = $currencies->display_price($new_products['products_price'], tep_get_tax_rate($new_products['products_tax_class_id']));
			$products_price_new = $currencies->display_price($new_products['specials_new_products_price'], tep_get_tax_rate($new_products['products_tax_class_id']));
		} else {
		  	$products_price = $currencies->display_price($new_products['products_price'], tep_get_tax_rate($new_products['products_tax_class_id']));
			$products_price_new = '';
		}
		
		if (strlen(strip_tags($product['products_description'])) > 0 && PRODUCT_LIST_DESCRIPTION_GRID > 0) {
		  if (strlen(strip_tags($product['products_description'])) > PRODUCT_LIST_DESCRIPTION_GRID) {
			$p_desc_grid =  '<div class="product-description description-grid">'.mb_substr(strip_tags($product['products_description']), 0, PRODUCT_LIST_DESCRIPTION_GRID, 'UTF-8').'...'.'</div>';
		  }
		  else {
			$p_desc_grid =  '<div class="product-description description-grid">'.strip_tags($product['products_description']).'</div>';
		  }
	  } else {
		$p_desc_grid ='';	  
	  }


		$new_prods_content .= tep_product_block_build(
	  		$productId 					= $new_products['products_id'],
			$productImage 				= $new_products['products_image'], 
			$productName 				= $new_products['products_name'],
			$productAdded 				= '',
			$productManufacturerId 		= '',
			$productManufacturerName 	= '',
			$productPrice 				= $products_price,
			$productPriceNew 			= $products_price_new,
			$productWeight 				= '', 
			$productQuantity 			= '', 
			$productModel 				= '',
			$productDescription 		= $p_desc_grid,
			$productButtons 			= true,
			$pageComming 				= FILENAME_DEFAULT,
			$elCount					= $i
			);
    }

    $new_prods_content .= '</ul>';
?>

  <h2 class="page-heading"><?php echo sprintf(TABLE_HEADING_NEW_PRODUCTS, strftime('%B')); ?></h2>

  <div class="block-content">
    <?php echo $new_prods_content; ?>
  </div>

<?php
  }
?>
