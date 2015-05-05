<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_FEATURED_PRODUCTS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_FEATURED_PRODUCTS));

  require(DIR_WS_INCLUDES . 'template_top.php');  
?>

<h1 class="page-heading product-list"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content">
  <?php
	$featured_products_array = array();
	$featured_products_query_raw = "select p.products_id, pd.products_name, p.products_image, p.products_price, p.products_tax_class_id, IF(s.status, s.specials_new_products_price, NULL) as specials_new_products_price, p.products_date_added, m.manufacturers_name, m.manufacturers_id
   from " . TABLE_PRODUCTS . " p left join " . TABLE_MANUFACTURERS . " m on p.manufacturers_id = m.manufacturers_id
   left join " . TABLE_PRODUCTS_DESCRIPTION . " pd on p.products_id = pd.products_id and pd.language_id = '" . $languages_id . "'
   left join " . TABLE_SPECIALS . " s on p.products_id = s.products_id
   left join " . TABLE_FEATURED . " f on p.products_id = f.products_id
   where p.products_status = '1' and f.status = '1' order by p.products_date_added DESC, pd.products_name";
   $featured_products_split = new splitPageResults($featured_products_query_raw, MAX_DISPLAY_PRODUCTS_FEATURED);
   if ($featured_products_split->number_of_rows > 0) {
   echo tep_gridlist_build();
   }

	if (($featured_products_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel top-panel top-view">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $featured_products_split->display_count(TEXT_DISPLAY_NUMBER_OF_FEATURED_PRODUCTS); ?></div>
      <div class="col-xs-6"><?php echo $featured_products_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) .'<span class="resultText">'.TEXT_RESULT_PAGE.'</span>'; ?></div>
    </div>
  </div>
  <?php
  }
?>
  <?php
 if ($featured_products_split->number_of_rows > 0) {
?>
  <?php
    $featured_query = tep_db_query($featured_products_split->sql_query);
	$featured_prods_content = '<ul class="row product-listing">';
	$i = 0;
   while ($featured = tep_db_fetch_array($featured_query)) {
	   $i++;
	   $product_query = tep_db_query("select products_description, products_id from " . TABLE_PRODUCTS_DESCRIPTION . " where products_id = '" . (int)$featured['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
	   $product = tep_db_fetch_array($product_query);
	   if ($new_price = tep_get_products_special_price($featured['products_id'])) {
        $products_price = 	$currencies->display_price($featured['products_price'], tep_get_tax_rate($featured['products_tax_class_id']));
		$products_price_new =	$currencies->display_price($new_price, tep_get_tax_rate($featured['products_tax_class_id']));
      } else {
        $products_price = $currencies->display_price($featured['products_price'], tep_get_tax_rate($featured['products_tax_class_id']));
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
	  $featured_prods_content .= tep_product_block_build(
	  		$productId 						= $featured['products_id'],
			$productImage 					= $featured['products_image'], 
			$productName 					= $featured['products_name'],
			$productAdded 					= $featured['products_date_added'],
			$productManufacturerId 			= $featured['manufacturers_id'],
			$productManufacturerName 		= $featured['manufacturers_name'],
			$productPrice 					= $products_price,
			$productPriceNew 				= $products_price_new,  
			$productWeight 					= '', 
			$productQuantity 				= '', 
			$productModel 					= '',
			$productDescription 			= $p_desc_list.$p_desc_grid,
			$productButtons 				= true,
			$pageComming 					= FILENAME_FEATURED_PRODUCTS,
			$elCount						= $i
			);
  }

  $featured_prods_content .= '</ul>';
  echo $featured_prods_content;


?>
  <?php
  } else {
?>
  <div class="alert alert-info"> <?php echo TEXT_NO_NEW_PRODUCTS; ?> </div>
  <?php
  }
?>
  <?php
  if (($featured_products_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel bottom-panel">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $featured_products_split->display_count(TEXT_DISPLAY_NUMBER_OF_FEATURED_PRODUCTS); ?></div>
      <div class="col-xs-6"><?php echo $featured_products_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) . '<span class="resultText">'.TEXT_RESULT_PAGE.'</span>'; ?></div>
    </div>
  </div>
</div>
<?php
  }
?>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
