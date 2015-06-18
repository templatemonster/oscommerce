<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_SPECIALS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_SPECIALS));

  require(DIR_WS_INCLUDES . 'template_top.php');
  $tag_id= $HTTP_GET_VARS['id_tag'];
  $tag_text="";
  $tags_query = tep_db_query("select * from ". TABLE_TAGS ." where tag_id='". $tag_id ."'");
  while ($tags_result = tep_db_fetch_array($tags_query)) {
    $tag_text = urldecode($tags_result['tag_text']);
  }
  
?>

<h1 class="page-heading product-list"><?php echo MODULE_BOXES_TAG_PAGE_TITLE. " \"".$tag_text."\""; ?></h1>
<div class="block-content">
  <?php


  $tags_query_raw = "select p.products_id, pd.products_name, p.products_price, p.products_tax_class_id, p.products_image from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd, ". TABLE_PRODUCTS_TAGS ." pt where p.products_status = '1' and pt.products_id = p.products_id and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' and pt.tag_id=".$tag_id." ";
  $tags_split = new splitPageResults($tags_query_raw, MAX_DISPLAY_SPECIAL_PRODUCTS);
  if ($tags_split->number_of_rows > 0) {
	  echo tep_gridlist_build();
  }
  if (($tags_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel top-panel top-view">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $tags_split->display_count(TEXT_DISPLAY_NUMBER_OF_SPECIALS); ?></div>
      <div class="col-xs-6"><?php echo $tags_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) .'<span class="resultText">'.TEXT_RESULT_PAGE.'</span>'; ?></div>
    </div>
  </div>
  <?php
  }
?>
  <ul class="row product-listing">
    <?php
    $row = 0;
    $tags_query = tep_db_query($tags_split->sql_query);
    while ($tags = tep_db_fetch_array($tags_query)) {
      
	  if ($new_price = tep_get_products_special_price($tags['products_id'])) {
      	$products_price = $currencies->display_price($tags['products_price'], tep_get_tax_rate($tags['products_tax_class_id']));
		$products_price_new = $currencies->display_price($new_price, tep_get_tax_rate($tags['products_tax_class_id']));
      } else {
      	$products_price = $currencies->display_price($tags['products_price'], tep_get_tax_rate($tags['products_tax_class_id']));
		$products_price_new = '';
	  }

		$tags_content .= tep_product_block_build(
	  		$productId 						= $tags['products_id'],
			$productImage 					= $tags['products_image'], 
			$productName 					= $tags['products_name'],
			$productAdded 					= '',
			$productManufacturerId 			= '',
			$productManufacturerName 		= '',
			$productPrice 					= $products_price,
			$productPriceNew 				= $products_price_new, 
			$productWeight 					= '', 
			$productQuantity 				= '', 
			$productModel 					= '',
			$productDescription 			= '',
			$productButtons 				= true,
			$pageComming 					= FILENAME_PRODUCT_INFO,
			$elCount						= $i
			);

    }
	echo $tags_content;
?>
  </ul>
  <?php
  if (($tags_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel bottom-panel">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $tags_split->display_count(TEXT_DISPLAY_NUMBER_OF_SPECIALS); ?></div>
      <div class="col-xs-6"><?php echo $tags_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))) .'<span class="resultText">'. TEXT_RESULT_PAGE.'</span>'; ?></div>
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
