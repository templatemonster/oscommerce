<?php

  class f_information_account {
    var $code = 'f_information_account';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
    var $pages;	

    function f_information_account() {
      $this->title = MODULE_BOXES_INFORMATION_ACCOUNT_TITLE;
      $this->description = MODULE_BOXES_INFORMATION_ACCOUNT_DESCRIPTION;

      if ( defined('MODULE_BOXES_INFORMATION_ACCOUNT_STATUS') ) {
        $this->sort_order = MODULE_BOXES_INFORMATION_ACCOUNT_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_INFORMATION_ACCOUNT_STATUS == 'True');
        $this->pages = MODULE_BOXES_INFORMATION_ACCOUNT_DISPLAY_PAGES;
        $this->group = 'boxes_footer';
      }
    }

	function execute() {
		global $oscTemplate;
	
		if (tep_session_is_registered('customer_id')) { 
			$login_link = tep_href_link('logoff.php');
			$login_title= MODULE_BOXES_INFORMATION_ACCOUNT_BOX_TITLE_LOGOFF;
			$acc_link = tep_href_link('account.php');
			$acc_title= MODULE_BOXES_INFORMATION_ACCOUNT_BOX_MY_ACCOUNT;
		} else{ 
			$login_link = tep_href_link('login.php');
			$login_title= MODULE_BOXES_INFORMATION_ACCOUNT_BOX_TITLE_LOGIN;
			$acc_link = tep_href_link('create_account.php');
			$acc_title= MODULE_BOXES_INFORMATION_ACCOUNT_BOX_CREATE_ACCOUNT;
		} 
		
		$data = '<div class="footer-box col-xs-3">' . 
	  			'	<h4>' . MODULE_BOXES_INFORMATION_ACCOUNT_BOX_TITLE . '</h4>' .
	  			'	<ul>' .
	  			'		<li><a href="' . $login_link . '">' . $login_title . '</a></li>' .
	  			'		<li><a href="' . $acc_link . '">' . $acc_title . '</a></li>' .
	  			'		<li><a href="' . tep_href_link(FILENAME_SHIPPING) . '">' . MODULE_BOXES_INFORMATION_ACCOUNT_BOX_SHIPPING . '</a></li>' .
	  			'	</ul>' .
				'</div>';
	
	$oscTemplate->addBlock($data, $this->group);
	}

    function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_INFORMATION_ACCOUNT_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Information Module', 'MODULE_BOXES_INFORMATION_ACCOUNT_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_INFORMATION_ACCOUNT_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_INFORMATION_ACCOUNT_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");	  	  
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_INFORMATION_ACCOUNT_STATUS', 'MODULE_BOXES_INFORMATION_ACCOUNT_SORT_ORDER', 'MODULE_BOXES_INFORMATION_ACCOUNT_DISPLAY_PAGES');
    }
  }
?>
