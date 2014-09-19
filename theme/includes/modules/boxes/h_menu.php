<?php

  class h_menu {
    var $code = 'h_menu';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
	var $pages;

    function h_menu() {
      $this->title = MODULE_BOXES_HEADER_MENU_TITLE;
      $this->description = MODULE_BOXES_HEADER_MENU_DESCRIPTION;

      if ( defined('MODULE_BOXES_HEADER_MENU_STATUS') ) {
        $this->sort_order = MODULE_BOXES_HEADER_MENU_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_HEADER_MENU_STATUS == 'True');
		$this->pages = MODULE_BOXES_HEADER_MENU_DISPLAY_PAGES;
        $this->group = ((MODULE_BOXES_HEADER_MENU_CONTENT_PLACEMENT == 'Header Top') ? 'header_top' : 'header');
      }
    }

    function execute() {
      global $cart, $oscTemplate;

      $data = '<div id="headerShortcuts" class="btn-group">' .
	  		  '    	 '. tep_draw_button(MODULE_BOXES_HEADER_MENU_DEFAULT,'btn btn-default',tep_href_link(FILENAME_DEFAULT)) .
			  '    	 '. tep_draw_button(MODULE_BOXES_HEADER_MENU_NEW,'btn btn-default',tep_href_link(FILENAME_PRODUCTS_NEW)) .
			  '    	 '. tep_draw_button(MODULE_BOXES_HEADER_MENU_FEATURED,'btn btn-default',tep_href_link(FILENAME_FEATURED_PRODUCTS)) .
			  '    	 '. tep_draw_button(MODULE_BOXES_HEADER_MENU_TOPSELLERS,'btn btn-default',tep_href_link(FILENAME_TOPSELLERS_PRODUCTS)) .
			  '    	 '. tep_draw_button(MODULE_BOXES_HEADER_MENU_SPECIALS,'btn btn-default',tep_href_link(FILENAME_SPECIALS)) .
			  '    	 '. tep_draw_button(MODULE_BOXES_HEADER_MENU_REVIEWS,'btn btn-default',tep_href_link(FILENAME_REVIEWS)) ;
			  
      $data.= '</div>';

      $oscTemplate->addBlock($data, $this->group);
    }

    function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_HEADER_MENU_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Search Module', 'MODULE_BOXES_HEADER_MENU_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_HEADER_MENU_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the left or right column?', '6', '1', 'tep_cfg_select_option(array(\'Header Top\', \'Header\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_HEADER_MENU_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_HEADER_MENU_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_HEADER_MENU_STATUS', 'MODULE_BOXES_HEADER_MENU_CONTENT_PLACEMENT', 'MODULE_BOXES_HEADER_MENU_SORT_ORDER', 'MODULE_BOXES_HEADER_MENU_DISPLAY_PAGES');
    }
  }
?>
