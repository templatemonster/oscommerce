<?php
  $listing_split = new splitPageResults($listing_sql, MAX_DISPLAY_SEARCH_RESULTS, 'p.products_id');
?>
<?php
  if ( ($listing_split->number_of_rows > 0) && ( (PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3') ) ) {
?>
<?php echo tep_gridlist_build();?>

<div class="listing-panel top-panel top-view">
  <div class="row">
    <div class="col-xs-6 displayText"><?php echo $listing_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS); ?></div>
    <div class="col-xs-6"><?php echo $listing_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) . '<span class="resultText">' . TEXT_RESULT_PAGE .'</span>'; ?></div>
  </div>
</div>
<?php
  }

  $prod_list_contents = '';

  if ($listing_split->number_of_rows > 0) {

    $listing_query = tep_db_query($listing_split->sql_query);

    $prod_list_contents .=   '    <ul class="row product-listing">';
	$i=0;
    while ($listing = tep_db_fetch_array($listing_query)) {
	$i++;
		$product_query = tep_db_query("select products_description, products_id from " . TABLE_PRODUCTS_DESCRIPTION . " where products_id = '" . (int)$listing['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
		$product = tep_db_fetch_array($product_query);
		
		if (tep_not_null($listing['specials_new_products_price'])) {
        	$products_price = $currencies->display_price($listing['products_price'], tep_get_tax_rate($listing['products_tax_class_id']));
			$products_price_new = $currencies->display_price($listing['specials_new_products_price'], tep_get_tax_rate($listing['products_tax_class_id']));
        } else {
        	$products_price = $currencies->display_price($listing['products_price'], tep_get_tax_rate($listing['products_tax_class_id']));
			$products_price_new ='';
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
		if (strlen(strip_tags($product['products_description'])) > 0 && PRODUCT_LIST_DESCRIPTION_LIST > 0) {
			if (strlen(strip_tags($product['products_description'])) > PRODUCT_LIST_DESCRIPTION_LIST) {
			   $p_desc_list =  '<div class="product-description description-list">'.mb_substr(strip_tags($product['products_description']), 0, PRODUCT_LIST_DESCRIPTION_LIST, 'UTF-8').'...'.'</div>';
			}
			else {
			   $p_desc_list =  '<div class="product-description description-list">'.strip_tags($product['products_description']).'</div>';    
			}
		} else {
			   $p_desc_list  ='';
		}
		
		$prod_list_contents .= tep_product_block_build(
	  		$productId 					= $listing['products_id'],
			$productImage 				= $listing['products_image'], 
			$productName 				= $listing['products_name'],
			$productAdded 				= '',
			$productManufacturerId 		= $listing['manufacturers_id'],
			$productManufacturerName 	= $listing['manufacturers_name'],
			$productPrice 				= $products_price,
			$productPriceNew 			= $products_price_new,
			$productWeight 				= $listing['products_weight'], 
			$productQuantity 			= $listing['products_quantity'], 
			$productModel 				= $listing['products_model'],
			$productDescription 		= $p_desc_grid.$p_desc_list,
			$productButtons 			= true,
			$pageComming 				= $PHP_SELF,
			$elCount					= $i
			);
    }

    $prod_list_contents .= '    </ul>';

    echo $prod_list_contents;
  } else {
?>
<div class="alert alert-info"><?php echo TEXT_NO_PRODUCTS; ?></div>
<?php
  }

  if ( ($listing_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3')) ) {
?>
<div class="listing-panel bottom-panel">
  <div class="row">
    <div class="col-xs-6 displayText"><?php echo $listing_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS); ?></div>
    <div class="col-xs-6"><?php echo $listing_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) . '<span class="resultText">' .TEXT_RESULT_PAGE .'</span>'; ?></div>
  </div>
</div>
<?php
  }
?>
