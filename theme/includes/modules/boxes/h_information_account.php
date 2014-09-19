<?php

  class h_information_account {
    var $code = 'h_information_account';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
	var $pages;

    function h_information_account() {
      $this->title = MODULE_BOXES_HEADER_ACCOUNT_TITLE;
      $this->description = MODULE_BOXES_HEADER_ACCOUNT_DESCRIPTION;

      if ( defined('MODULE_BOXES_HEADER_ACCOUNT_STATUS') ) {
        $this->sort_order = MODULE_BOXES_HEADER_ACCOUNT_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_HEADER_ACCOUNT_STATUS == 'True');
		$this->pages = MODULE_BOXES_HEADER_ACCOUNT_DISPLAY_PAGES;
        $this->group = ((MODULE_BOXES_HEADER_ACCOUNT_CONTENT_PLACEMENT == 'Header Top') ? 'header_top' : 'header');
      }
    }

    function execute() {
      global $oscTemplate;

      $data = '<div id="headerShortcutsTop" class="btn-group">' .
              '    	 ' . tep_draw_button(HEADER_TITLE_MY_ACCOUNT, 'btn btn-default', tep_href_link(FILENAME_ACCOUNT, '', 'SSL'));
			  
			  if (tep_session_is_registered('customer_id')) {
					$data.= tep_draw_button(HEADER_TITLE_LOGOFF, 'btn btn-default', tep_href_link(FILENAME_LOGOFF, '', 'SSL'));  
			  } else {
				  	$data.= tep_draw_button(HEADER_TITLE_LOGIN, 'btn btn-default', tep_href_link(FILENAME_LOGIN, '', 'SSL'));
			  }
			  
      $data.= '</div>';

      $oscTemplate->addBlock($data, $this->group);
    }

    function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_HEADER_ACCOUNT_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Search Module', 'MODULE_BOXES_HEADER_ACCOUNT_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_HEADER_ACCOUNT_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the left or right column?', '6', '1', 'tep_cfg_select_option(array(\'Header Top\', \'Header\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_HEADER_ACCOUNT_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_HEADER_ACCOUNT_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_HEADER_ACCOUNT_STATUS', 'MODULE_BOXES_HEADER_ACCOUNT_CONTENT_PLACEMENT', 'MODULE_BOXES_HEADER_ACCOUNT_SORT_ORDER', 'MODULE_BOXES_HEADER_ACCOUNT_DISPLAY_PAGES');
    }
  }
?>
