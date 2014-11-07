<?php

  class h_currencies {
    var $code = 'h_currencies';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
	var $pages;

    function h_currencies() {
      $this->title = MODULE_BOXES_H_CURRENCIES_TITLE;
      $this->description = MODULE_BOXES_H_CURRENCIES_DESCRIPTION;

      if ( defined('MODULE_BOXES_H_CURRENCIES_STATUS') ) {
        $this->sort_order = MODULE_BOXES_H_CURRENCIES_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_H_CURRENCIES_STATUS == 'True');
		$this->pages = MODULE_BOXES_H_CURRENCIES_DISPLAY_PAGES;
		$this->group = ((MODULE_BOXES_H_CURRENCIES_CONTENT_PLACEMENT == 'Header Top') ? 'header_top' : 'header');
      }
    }

    function execute() {
      global $PHP_SELF, $currencies, $HTTP_GET_VARS, $request_type, $currency, $oscTemplate;

      if (substr(basename($PHP_SELF), 0, 8) != 'checkout') {
        if (isset($currencies) && is_object($currencies) && (count($currencies->currencies) > 1)) {
          reset($currencies->currencies);
          $currencies_array = array();
          while (list($key, $value) = each($currencies->currencies)) {
            $currencies_array[] = array('id' => $key, 'text' => $value['title']);
          }

          $hidden_get_variables = '';

          reset($HTTP_GET_VARS);
          while (list($key, $value) = each($HTTP_GET_VARS)) {
            if ( is_string($value) && ($key != 'currency') && ($key != tep_session_name()) && ($key != 'x') && ($key != 'y') ) {
              $hidden_get_variables .= tep_draw_hidden_field($key, $value);
            }
          }

          $data = '<div class="headerBox currencies">' .
                  '  <span class="headerTitle currencies-title">' . MODULE_BOXES_H_CURRENCIES_BOX_TITLE . '</span>' .
                  '  <div class="headerBoxContents">' . 
                  '    ' . tep_draw_form('currencies', tep_href_link($PHP_SELF, '', $request_type, false), 'get') .
                  '    ' . tep_draw_pull_down_menu('currency', $currencies_array, $currency, 'onchange="this.form.submit();"') . $hidden_get_variables . tep_hide_session_id() . '</form>' .
                  '  </div>' .
                  '</div>';

          $oscTemplate->addBlock($data, $this->group);
        }
      }
    }

    function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_H_CURRENCIES_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Currencies Module', 'MODULE_BOXES_H_CURRENCIES_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_H_CURRENCIES_CONTENT_PLACEMENT', 'Header Top', '', '', '1', 'tep_cfg_select_option(array(\'Header Top\', \'Header\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_H_CURRENCIES_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_H_CURRENCIES_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_H_CURRENCIES_STATUS', 'MODULE_BOXES_H_CURRENCIES_CONTENT_PLACEMENT', 'MODULE_BOXES_H_CURRENCIES_SORT_ORDER', 'MODULE_BOXES_H_CURRENCIES_DISPLAY_PAGES');
    }
  }
?>