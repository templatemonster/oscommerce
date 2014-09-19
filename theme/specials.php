<?php
  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_SPECIALS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_SPECIALS));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading product-list"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content">
  <?php
  $specials_query_raw = "select p.products_id, pd.products_name, p.products_price, p.products_tax_class_id, p.products_image, p.products_date_added, s.specials_new_products_price, m.manufacturers_name, m.manufacturers_id from " . TABLE_PRODUCTS . " p left join " . TABLE_MANUFACTURERS . " m on (p.manufacturers_id = m.manufacturers_id), " . TABLE_PRODUCTS_DESCRIPTION . " pd, " . TABLE_SPECIALS . " s where p.products_status = '1' and s.products_id = p.products_id and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' and s.status = '1' order by s.specials_date_added DESC";
  $specials_split = new splitPageResults($specials_query_raw, MAX_DISPLAY_SPECIAL_PRODUCTS);
	if ($specials_split->number_of_rows > 0) {
		echo tep_gridlist_build();
	}
  if (($specials_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel top-panel top-view">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $specials_split->display_count(TEXT_DISPLAY_NUMBER_OF_SPECIALS); ?></div>
      <div class="col-xs-6"><?php echo $specials_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) . '<span class="resultText">'.TEXT_RESULT_PAGE . '</span>'; ?></div>
    </div>
  </div>
  <?php
  }
?>
  <ul class="row product-listing">
    <?php
    $specials_query = tep_db_query($specials_split->sql_query);
	$i=0;
    while ($specials = tep_db_fetch_array($specials_query)) {
	$i++;
	$product_query = tep_db_query("select products_description, products_id from " . TABLE_PRODUCTS_DESCRIPTION . " where products_id = '" . (int)$specials['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
    $product = tep_db_fetch_array($product_query);
	
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


		$products_price = $currencies->display_price($specials['products_price'], tep_get_tax_rate($specials['products_tax_class_id']));
		$products_price_new = $currencies->display_price($specials['specials_new_products_price'], tep_get_tax_rate($specials['products_tax_class_id']));
		
		$specials_content .= tep_product_block_build(
	  		$productId 					= $specials['products_id'],
			$productImage 				= $specials['products_image'], 
			$productName 				= $specials['products_name'],
			$productAdded 				= $specials['products_date_added'],
			$productManufacturerId 		= $specials['manufacturers_id'],
			$productManufacturerName 	= $specials['manufacturers_name'],
			$productPrice 				= $products_price,
			$productPriceNew 			= $products_price_new, 
			$productWeight 				= '', 
			$productQuantity 			= '', 
			$productModel 				= '',
			$productDescription 		= $p_desc_list.$p_desc_grid,
			$productButtons 			= true,
			$pageComming 				= FILENAME_SPECIALS,
			$elCount					= $i
			);

    }
	echo $specials_content;
?>
  </ul>
  <?php
	if (($specials_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel bottom-panel">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $specials_split->display_count(TEXT_DISPLAY_NUMBER_OF_SPECIALS); ?></div>
      <div class="col-xs-6"><?php echo $specials_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) . '<span class="resultText">'.TEXT_RESULT_PAGE .'</span>'; ?></div>
    </div>
  </div>
  <?php
  }
?>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
