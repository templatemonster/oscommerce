<?php
  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PRODUCTS_NEW);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_PRODUCTS_NEW));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading product-list"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content">
  <?php
  $products_new_array = array();

  $products_new_query_raw = "select p.products_id, pd.products_name, p.products_image, p.products_price, p.products_tax_class_id, p.products_date_added, m.manufacturers_name, m.manufacturers_id from " . TABLE_PRODUCTS . " p left join " . TABLE_MANUFACTURERS . " m on (p.manufacturers_id = m.manufacturers_id), " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' order by p.products_date_added DESC, pd.products_name";
  $products_new_split = new splitPageResults($products_new_query_raw, MAX_DISPLAY_PRODUCTS_NEW);
	if ($products_new_split->number_of_rows > 0) {
		echo tep_gridlist_build();
	}
  if (($products_new_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel top-panel top-view">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $products_new_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS_NEW); ?></div>
      <div class="col-xs-6"><?php echo $products_new_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) . '<span class="resultText">'. TEXT_RESULT_PAGE . '</span>'; ?></div>
    </div>
  </div>
  <?php
  }
?>
  <?php
  if ($products_new_split->number_of_rows > 0) {
?>
  <ul class="row product-listing">
    <?php
    $products_new_query = tep_db_query($products_new_split->sql_query);
	$i=0;
    while ($products_new = tep_db_fetch_array($products_new_query)) {
		$i++;
		$product_query = tep_db_query("select products_description, products_id from " . TABLE_PRODUCTS_DESCRIPTION . " where products_id = '" . (int)$products_new['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
    	$product = tep_db_fetch_array($product_query);
	
      if ($new_price = tep_get_products_special_price($products_new['products_id'])) {
        $products_price =  $currencies->display_price($products_new['products_price'], tep_get_tax_rate($products_new['products_tax_class_id']));
		$products_price_new = $currencies->display_price($new_price, tep_get_tax_rate($products_new['products_tax_class_id']));
      } else {
        $products_price = $currencies->display_price($products_new['products_price'], tep_get_tax_rate($products_new['products_tax_class_id']));
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
	  
	 $products_new_content .= tep_product_block_build(
	  		$productId 					= $products_new['products_id'],
			$productImage 				= $products_new['products_image'], 
			$productName 				= $products_new['products_name'],
			$productAdded 				= $products_new['products_date_added'],
			$productManufacturerId 		= $products_new['manufacturers_id'],
			$productManufacturerName 	= $products_new['manufacturers_name'],
			$productPrice 				= $products_price,
			$productPriceNew 			= $products_price_new,
			$productWeight 				= '', 
			$productQuantity 			= '', 
			$productModel 				= '',
			$productDescription 		= $p_desc_list.$p_desc_grid,
			$productButtons 			= true,
			$pageComming 				= FILENAME_PRODUCTS_NEW,
			$elCount					=$i
			);
    }
	
	echo $products_new_content;
?>
  </ul>
  <?php
  } else {
?>
  <div class="alert alert-info"> <?php echo TEXT_NO_NEW_PRODUCTS; ?> </div>
  <?php
  }

  if (($products_new_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel bottom-panel">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $products_new_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS_NEW); ?></div>
      <div class="col-xs-6"><?php echo $products_new_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) . '<span class="resultText">'. TEXT_RESULT_PAGE . '</span>'; ?></div>
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
