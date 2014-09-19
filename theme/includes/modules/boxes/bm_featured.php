
<?php
class bm_featured {
    var $code = 'bm_featured';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
	var $pages;

    function bm_featured() {
      $this->title = MODULE_BOXES_FEATURED_TITLE;
      $this->description = MODULE_BOXES_FEATURED_DESCRIPTION;

      if ( defined('MODULE_BOXES_FEATURED_STATUS') ) {
        $this->sort_order = MODULE_BOXES_FEATURED_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_FEATURED_STATUS == 'True');
		$this->pages = MODULE_BOXES_FEATURED_DISPLAY_PAGES;
        $this->group = ((MODULE_BOXES_FEATURED_CONTENT_PLACEMENT == 'Left Column') ? 'boxes_column_left' : 'boxes_column_right');
      }
    }
	function execute() {
		global $HTTP_GET_VARS, $languages_id, $currencies, $oscTemplate;
		if (!isset($HTTP_GET_VARS['products_id'])) {
				if ($random_product = tep_random_select("select p.products_id, p.products_image, p.products_price, p.products_tax_class_id, IF(s.status, s.specials_new_products_price, NULL) as specials_new_products_price, p.products_date_added, pd.products_name
		  from " . TABLE_PRODUCTS . " p left join " . TABLE_PRODUCTS_DESCRIPTION . " pd on p.products_id = pd.products_id and pd.language_id = '" . $languages_id . "'
		  left join " . TABLE_SPECIALS . " s on p.products_id = s.products_id
		  left join " . TABLE_FEATURED . " f on p.products_id = f.products_id
			  where p.products_status = '1' and f.status = '1' order by rand() DESC limit " . MAX_DISPLAY_FEATURED_PRODUCTS)) {
				  if (tep_not_null($random_product['specials_new_products_price'])) {
					  $new_price = '<s class="old-price price">' . $currencies->display_price($random_product['products_price'], tep_get_tax_rate($random_product['products_tax_class_id'])) . '</s><br>';
					  $new_price .= '<span class="new-price price">' . $currencies->display_price($random_product['specials_new_products_price'], tep_get_tax_rate($random_product['products_tax_class_id'])) . '</span>';
					} else {
					  $new_price = '<span class="price">'.$currencies->display_price($random_product['products_price'], tep_get_tax_rate($random_product['products_tax_class_id'])).'</span>';
					}
				  
				  $faturedProduct  ='';
				  $featuredProduct .='<div class="module featured-box">'.
									'	<h3 class="module-heading"><a href="'.tep_href_link(FILENAME_FEATURED_PRODUCTS).'">'.BOX_HEADING_FEATURED.'</a></h3>'.
									'	<ul class="module-content boxproduct">'.
									'		<li class="clearfix">'.
									'			<a class="boxproduct-img" href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $random_product['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $random_product['products_image'], $random_product['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>'.
									'			<div class="boxproduct-info">'.
									'				<a class="product-name" href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $random_product['products_id']) . '">' . $random_product['products_name'] . '</a>'.
									'				<div class="price-box">'. $new_price.'</div>'.
									'			</div>'.
									'		</li>'.
									'	</ul>'.
									'</div>';
				$oscTemplate->addBlock($featuredProduct, $this->group);
			}
		}
	}
	
	function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_FEATURED_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Featured Module', 'MODULE_BOXES_FEATURED_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_FEATURED_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', '6', '1', 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_FEATURED_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_FEATURED_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }
    function keys() {
		  return array('MODULE_BOXES_FEATURED_STATUS', 'MODULE_BOXES_FEATURED_CONTENT_PLACEMENT', 'MODULE_BOXES_FEATURED_SORT_ORDER', 'MODULE_BOXES_FEATURED_DISPLAY_PAGES');
		}
	}
?>
