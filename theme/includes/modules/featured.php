<!-- featured_products //-->
<?php
if( defined('FEATURED_PRODUCTS_DISPLAY') AND FEATURED_PRODUCTS_DISPLAY == 'true' ) {
  $featured_products_category_id =  (isset($new_products_category_id))?$new_products_category_id:'0';
  $cat_name_query = tep_db_query('SELECT `categories_name` FROM ' . TABLE_CATEGORIES_DESCRIPTION . " WHERE `categories_id` = '" . $featured_products_category_id . "' limit 1");
  $cat_name_fetch = tep_db_fetch_array($cat_name_query);
  $cat_name = $cat_name_fetch['categories_name'];
  $info_box_contents = array();

  list($usec, $sec) = explode(' ', microtime());
  srand( (float) $sec + ((float) $usec * 100000) );
  $mtm= rand();
  	
  if ( (!isset($featured_products_category_id)) || ($featured_products_category_id == '0') ) {
  	$info_box_contents[] = array('align' => 'left', 'text' => '<a class="headerNavigation" href="' . tep_href_link(FILENAME_FEATURED_PRODUCTS) . '">' . TABLE_HEADING_FEATURED_PRODUCTS . '</a>');

    // Phocea Optimize featured query
    // Ben: Option to only show featured products on sale
    $query = 'SELECT p.products_id, p.products_image, p.products_tax_class_id, IF (s.status, s.specials_new_products_price, NULL) AS specials_new_products_price, p.products_price, pd.products_name ';

	if ( defined('FEATURED_PRODUCTS_SPECIALS_ONLY') AND FEATURED_PRODUCTS_SPECIALS_ONLY == 'true' ) {
      $query .= 'FROM ' . TABLE_SPECIALS . ' s LEFT JOIN ' . TABLE_PRODUCTS . ' p ON s.products_id = p.products_id ';
	} else {
      $query .= 'FROM ' . TABLE_PRODUCTS . ' p LEFT JOIN ' . TABLE_SPECIALS . ' s ON p.products_id = s.products_id ';
	}
	if($current_page && $current_page == FILENAME_DEFAULT) {
		$query .= 'LEFT JOIN ' . TABLE_PRODUCTS_DESCRIPTION . " pd ON p.products_id = pd.products_id AND pd.language_id = '" . $languages_id . "'
		LEFT JOIN " . TABLE_FEATURED . " f ON p.products_id = f.products_id
		WHERE p.products_status = '1' AND f.status = '1' order by rand($mtm) DESC limit " . MAX_DISPLAY_FEATURED_PRODUCTS_HOME;
	}
	else {
		$query .= 'LEFT JOIN ' . TABLE_PRODUCTS_DESCRIPTION . " pd ON p.products_id = pd.products_id AND pd.language_id = '" . $languages_id . "'
		LEFT JOIN " . TABLE_FEATURED . " f ON p.products_id = f.products_id
		WHERE p.products_status = '1' AND f.status = '1' order by rand($mtm) DESC limit " . MAX_DISPLAY_FEATURED_PRODUCTS;	
	}

    $featured_products_query = tep_db_query( $query );	
	$title = TABLE_HEADING_FEATURED_PRODUCTS;
  } else {
    $title = sprintf(TABLE_HEADING_FEATURED_PRODUCTS_CATEGORY, $cat_name);
    $subcategories_array = array();
    tep_get_subcategories($subcategories_array, $featured_products_category_id);
    $featured_products_category_id_list = tep_array_values_to_string($subcategories_array);
    if ($featured_products_category_id_list == '') {
      $featured_products_category_id_list .= $featured_products_category_id;
    } else {
      $featured_products_category_id_list .= ',' . $featured_products_category_id;
    }

	if ( defined('FEATURED_PRODUCTS_SUB_CATEGORIES') AND FEATURED_PRODUCTS_SUB_CATEGORIES == 'true' ) {
      // current catID as starting value
      $cats[] = $new_products_category_id; 
      // put cat-IDs of all cats nested in current branch into $cats array, 
      // go through all subbranches
      for($i=0; $i<count($cats); $i++) {
        $categorie_query = tep_db_query('SELECT `categories_id` FROM ' . TABLE_CATEGORIES . " WHERE parent_id = '" . (int)$cats[$i] . "'"); 
        while ($categorie = tep_db_fetch_array($categorie_query)) {
          $cats[] = $categorie['categories_id'];
        }
	    // sort out doubles
        $cats = array_unique($cats);
      }
      $catIdSql = implode(', ', $cats);
	} else {
      $catIdSql = $featured_products_category_id_list;
	}

    // Phocea Optimize featured query
	$query = 'SELECT distinct p.products_id, p.products_image, p.products_tax_class_id, IF (s.status, s.specials_new_products_price, NULL) AS specials_new_products_price, p.products_price, pd.products_name
    FROM ' . TABLE_PRODUCTS . ' p LEFT JOIN ' . TABLE_PRODUCTS_TO_CATEGORIES . ' p2c using(products_id)
    LEFT JOIN ' . TABLE_CATEGORIES . ' c USING (categories_id)
    LEFT JOIN ' . TABLE_FEATURED . ' f ON p.products_id = f.products_id
    LEFT JOIN ' . TABLE_SPECIALS . ' s ON p.products_id = s.products_id
    LEFT JOIN ' . TABLE_PRODUCTS_DESCRIPTION . " pd ON p.products_id = pd.products_id AND pd.language_id = '" . $languages_id . "' 
    where c.categories_id IN(" . $catIdSql . ") AND p.products_status = '1' AND f.status = '1' ";

	if ( defined('FEATURED_PRODUCTS_SPECIALS_ONLY') AND FEATURED_PRODUCTS_SPECIALS_ONLY == 'true' ) {
		$query .= " AND s.status = '1' ";
	}
	$query .= 'ORDER BY rand(' . $mtm . ') DESC LIMIT ' . MAX_DISPLAY_FEATURED_PRODUCTS;
}
	$featured_products_query = tep_db_query( $query );
	if(tep_db_num_rows($featured_products_query) > 0){
		$info_box_content = '<h2 class="page-heading">'.$title.'</h2>';
		$i = 0;
		$info_box_content .= '<div class="block-content"><ul class="row product-listing grid">';
		while ($featured_products = tep_db_fetch_array($featured_products_query)) {
		$i++;	
		$product_query = tep_db_query("select products_description, products_id from " . TABLE_PRODUCTS_DESCRIPTION . " where products_id = '" . (int)$featured_products['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
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
		// If on special show regular and sale price
		if (tep_not_null($featured_products['specials_new_products_price'])) {
			$products_price = $currencies->display_price($featured_products['products_price'], tep_get_tax_rate($featured_products['products_tax_class_id']));
			$products_price_new .= $currencies->display_price($featured_products['specials_new_products_price'], tep_get_tax_rate($featured_products['products_tax_class_id']));
		} else {
		  $products_price = $currencies->display_price($featured_products['products_price'], tep_get_tax_rate($featured_products['products_tax_class_id']));
		  $products_price_new = '';
		}
		$info_box_content .= tep_product_block_build(
	  		$productId 					= $featured_products['products_id'],
			$productImage 				= $featured_products['products_image'], 
			$productName 				= $featured_products['products_name'],
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
	  $info_box_content .='</ul></div>';
	  echo $info_box_content;
	}
  
} else {
   // If it's disabled, then include the original New Products box
   // include (DIR_WS_MODULES . FILENAME_NEW_PRODUCTS); // disable for dont show if desactive the feature module
}
?>
<!-- featured_products_eof //-->
