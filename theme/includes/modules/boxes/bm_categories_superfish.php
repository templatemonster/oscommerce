<?php
	if (!class_exists('bm_categories_superfish')) {
		class bm_categories_superfish
		{
			var $code = 'bm_categories_superfish';
			var $group = 'boxes';
			var $title;
			var $description;
			var $sort_order;
			var $enabled = false;
			////
			// Set up the defaults
			public function bm_categories_superfish()
			{
				$this->title       = MODULE_BOXES_CATEGORIES_SUPERFISH_TITLE;
				$this->description = MODULE_BOXES_CATEGORIES_SUPERFISH_DESCRIPTION;
				if (defined('MODULE_BOXES_CATEGORIES_SUPERFISH_STATUS')) {
					$this->sort_order = MODULE_BOXES_CATEGORIES_SUPERFISH_SORT_ORDER;
					$this->pages      = MODULE_BOXES_CATEGORIES_SUPERFISH_DISPLAY_PAGES;
					$this->enabled    = (MODULE_BOXES_CATEGORIES_SUPERFISH_STATUS == 'True');
				}
				$this->group = ((MODULE_BOXES_CATEGORIES_SUPERFISH_CONTENT_PLACEMENT == 'Header') ? 'header' : 'header_top');
			}
			////
			// Used by the oscTemplate class to generate the module
			public function execute()
			{
				global $oscTemplate;
				if ((USE_CACHE == 'true') && empty($SID)) {
					$module_contents = tep_cache_categories_superfish_box();
				} else {
					$module_contents = $this->generate_box();
				} // if ((USE_CACHE ... else
				$oscTemplate->addBlock($module_contents, $this->group);
			} // function execute
			////
			// Is the module enabled?
			public function isEnabled()
			{
				return $this->enabled;
			}
			////
			// Check the module status
			public function check()
			{
				return defined('MODULE_BOXES_CATEGORIES_SUPERFISH_STATUS');
			}
			////
			// Install the module
			public function install()
			{
				include_once(DIR_WS_CLASSES . 'language.php');
				$bm_superfish_language_class = new language;
				$languages                   = $bm_superfish_language_class->catalog_languages;
				foreach ($languages as $this_language) {
					$this->languages_array[$this_language['id']] = $this_language['directory'];
				}
				tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_CATEGORIES_SUPERFISH_SORT_ORDER', '1002', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
				tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Superfish Categories Box', 'MODULE_BOXES_CATEGORIES_SUPERFISH_STATUS', 'True', 'Do you want to show the Superfish Categories in the header?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
				tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_CATEGORIES_SUPERFISH_CONTENT_PLACEMENT', 'Header', 'Where should the module be loaded?', '6', '1', 'tep_cfg_select_option(array(\'Header\', \'Header Top\'), ', now())");
				tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_CATEGORIES_SUPERFISH_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
			}
			////
			// Uninstall the module
			public function remove()
			{
				tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
			}
			////
			// Database keys
			public function keys()
			{
				include_once(DIR_WS_CLASSES . 'language.php');
				$bm_superfish_language_class = new language;
				$languages                   = $bm_superfish_language_class->catalog_languages;
				foreach ($languages as $this_language) {
					$this->languages_array[$this_language['id']] = $this_language['directory'];
				}
				$keys   = array();
				$keys[] = 'MODULE_BOXES_CATEGORIES_SUPERFISH_SORT_ORDER';
				$keys[] = 'MODULE_BOXES_CATEGORIES_SUPERFISH_STATUS';
				$keys[] = 'MODULE_BOXES_CATEGORIES_SUPERFISH_CONTENT_PLACEMENT';
				$keys[] = 'MODULE_BOXES_CATEGORIES_SUPERFISH_DISPLAY_PAGES';
				return $keys;
			}
			////
			// Get the categories from the database and load them into a tree array
			private function get_subcategories($parent_id)
			{
				if (tep_has_category_subcategories($parent_id)) {
					global $languages_id;
					$categories_data      = array();
					// Retrieve the data on the subcategories
					$categories_query_raw = "
				select
				  c.categories_id,
				  c.parent_id,
				  cd.categories_name
				from " . TABLE_CATEGORIES_DESCRIPTION . " cd
				  join " . TABLE_CATEGORIES . " c
					on (c.categories_id = cd.categories_id)
				where
				  c.parent_id = '" . ( int ) $parent_id . "'
				  and cd.language_id = '" . ( int ) $languages_id . "'
				order by
				  c.sort_order,
				  cd.categories_name
			  ";
					//print 'Categories Query: ' . $categories_query_raw . '<br />';
					$categories_query     = tep_db_query($categories_query_raw);
					// Load the subcategory data into an array
					$index                = 0;
					while ($categories = tep_db_fetch_array($categories_query)) {
						$categories_id = ( int ) $categories['categories_id'];
						$path_string   = $this->get_category_path($categories_id);
						if ($categories_id != 0) {
							$categories_data[$index] = array(
								'id' => $categories_id,
								'name' => $categories['categories_name'],
								'parent_id' => $categories['parent_id'],
								'path' => $path_string
							);
							// If the category has subcats, add them to the array
							if (tep_has_category_subcategories($categories_id)) {
								$categories_data[$index]['subcat'] = $this->get_subcategories($categories_id);
							} else {
								$categories_data[$index]['subcat'] = false;
							}
						} // if( $categories_id
						$index++;
					} //while ($categories
					return $categories_data;
				} else {
					return false;
				}
			}
			////
			// Format the category tree with the correct HTML
			private function format_data($data_array, $pass = false)
			{
				if (is_array($data_array) && count($data_array) > 0) {
					if ($pass == false) {
						$output = '<ul class="sf-menu">' . PHP_EOL;
					} else {
						$output = '<ul>' . PHP_EOL;
					}
					foreach ($data_array as $category) {
						if ($category['parent_id'] == 0) {
							$output .= '    <li class="first-level">' . PHP_EOL;
						} else {
							$output .= '    <li class="subcat">' . PHP_EOL;
						}
						$output .= '      <a href="' . tep_href_link(FILENAME_DEFAULT, $category['path'], 'NONSSL') . '">';
						$output .= $category['name'];
						$output .= '</a>' . PHP_EOL;
						if ($category['subcat'] !== false) {
							$output .= $this->format_data($category['subcat'], true);
						}
						$output .= '    </li>' . PHP_EOL;
					}
					$output .= '  </ul>' . PHP_EOL;
					$output .= "
						<script type='text/javascript'>
							jQuery(document).ready(function(){
							  jQuery('ul.sf-menu').superfish({
								animation: {opacity: 'show'},   // slide-down effect without fade-in
								delay:     800               // 1.2 second delay on mouseout
							  });
							});
					  </script>
				";
					return $output;
				} else {
					return false;
				}
			} //private function format_data
			////
			// Generate the Superfish categories box
			//   Used internally to supply the box HTML to either the cache function or the module template
			private function generate_box()
			{
				global $language;
				$module_contents = '<div id="top-menu" class="sf-container clearfix">' . PHP_EOL;
				// Add a header and title if one is provided in the admin
				//$title           = constant('MODULE_BOXES_CATEGORIES_SUPERFISH_FRONT_TITLE');
				// Get the category tree array
				$category_tree   = $this->get_subcategories(0);
				// feed the tree array to the formatting method
				$module_contents .= $this->format_data($category_tree);
				// Clear all and end output
				$module_contents .= '</div>' . PHP_EOL;
				return $module_contents;
			} // private function generate_box
			////
			// Generate the output for the cache function
			public function getData()
			{
				return $this->generate_box();
			}
			////
			// Generate a path to categories
			private function get_category_path($category_id)
			{
				if (tep_not_null($category_id)) {
					$cPath_new  = '';
					$categories = array(); // Initialize the array so the function doesn't complain
					tep_get_parent_categories($categories, $category_id);
					$categories = array_reverse($categories);
					$cPath_new .= implode('_', $categories);
					if (tep_not_null($cPath_new))
						$cPath_new .= '_';
					$cPath_new .= $category_id;
					return 'cPath=' . $cPath_new;
				}
				return false;
			} // private function get_category_path(
		}
	}
?>