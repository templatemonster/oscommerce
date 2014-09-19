<?php

  class h_languages {
    var $code = 'h_languages';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
	var $pages;

    function h_languages() {
      $this->title = MODULE_BOXES_HEADER_LANGUAGES_TITLE;
      $this->description = MODULE_BOXES_HEADER_LANGUAGES_DESCRIPTION;

      if ( defined('MODULE_BOXES_HEADER_LANGUAGES_STATUS') ) {
        $this->sort_order = MODULE_BOXES_HEADER_LANGUAGES_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_HEADER_LANGUAGES_STATUS == 'True');
		$this->pages = MODULE_BOXES_HEADER_LANGUAGES_DISPLAY_PAGES;
        $this->group = ((MODULE_BOXES_HEADER_LANGUAGES_CONTENT_PLACEMENT == 'Header Top') ? 'header_top' : 'header');
      }
    }

    function execute() {
      global $PHP_SELF, $lng, $request_type, $oscTemplate, $language, $request_type, $HTTP_GET_VARS, $current_lang_key;

      if (substr(basename($PHP_SELF), 0, 8) != 'checkout') {
        if (!isset($lng) || (isset($lng) && !is_object($lng))) {
          include(DIR_WS_CLASSES . 'language.php');
          $lng = new language;
        }

        if (count($lng->catalog_languages) > 1) {
		  reset($lng->catalog_languages);
          $languages_array = array();
          while (list($key, $value) = each($lng->catalog_languages)) {
			$languages_array[] = array('id' => $key, 'text' => $value['name']);
          }
		  
		  foreach( $lng->catalog_languages as $key => $value ) {
            if ( $value['directory'] == $language ) {
              $current_lang_key = $key;
              break;
            }
          }
		  
		  reset($HTTP_GET_VARS);
          while (list($key, $value) = each($HTTP_GET_VARS)) {
            if ( is_string($value) && ($key != 'language') && ($key != tep_session_name()) && ($key != 'x') && ($key != 'y') ) {
              $hidden_get_variables .= tep_draw_hidden_field($key, $value);
            }
          }

          $data = '<div class="headerBox languages">' .
                  '  <span class="headerTitle languages-title">' . MODULE_BOXES_HEADER_LANGUAGES_BOX_TITLE . '</span>' .
                  '  <div class="headerBoxContents">' . 
                  '    ' . tep_draw_form('languages', tep_href_link($PHP_SELF, '', $request_type, false), 'get') .
                  '    ' . tep_draw_pull_down_menu('language', $languages_array, $current_lang_key, 'onchange="this.form.submit();"') . $hidden_get_variables . tep_hide_session_id() . '</form>' .
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
      return defined('MODULE_BOXES_HEADER_LANGUAGES_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Languages Module', 'MODULE_BOXES_HEADER_LANGUAGES_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_HEADER_LANGUAGES_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the left or right column?', '6', '1', 'tep_cfg_select_option(array(\'Header Top\', \'Header\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_HEADER_LANGUAGES_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_HEADER_LANGUAGES_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_HEADER_LANGUAGES_STATUS', 'MODULE_BOXES_HEADER_LANGUAGES_CONTENT_PLACEMENT', 'MODULE_BOXES_HEADER_LANGUAGES_SORT_ORDER', 'MODULE_BOXES_HEADER_LANGUAGES_DISPLAY_PAGES');
    }
  }
/*function execute() {
      global $PHP_SELF, $lng, $request_type, $language, $oscTemplate, $current_lang_key;

      if (substr(basename($PHP_SELF), 0, 8) != 'checkout') {
        if (!isset($lng) || (isset($lng) && !is_object($lng))) {
          include(DIR_WS_CLASSES . 'language.php');
          $lng = new language;
        }

        if (count($lng->catalog_languages) > 1) {
		 foreach( $lng->catalog_languages as $key => $value ) {
            if ( $value['directory'] == $language ) {
              $current_lang_key = $key;
              break;
            }
          }
          $languages_string = '';
          reset($lng->catalog_languages);
          while (list($key, $value) = each($lng->catalog_languages)) {
			  if ($current_lang_key == $key )	{
				  $this_selected = 'selected="selected"';
			  }else{
				  $this_selected = '';
			  }		 	
			$languages_string .= ' <option '.$current_lang.' '.$this_selected.' value="'.$key.'">'.$value['name'].'</option>';
          }
		  $languages_string .= '</ul>';
          $data = '<div class="headerBox languages">' .
                  ' <span class="headerTitle language-title">' . MODULE_BOXES_HEADER_LANGUAGES_BOX_TITLE . '</span>' .
                  '<div class="headerBoxContents">'. tep_draw_form('language', tep_href_link(basename($PHP_SELF), '', $request_type, false), 'get') .' 
				  <select class="form-control" name="language" onchange="this.form.submit();">' . $languages_string  . '</select></form></div>'.
                  '</div>';

          $oscTemplate->addBlock($data, $this->group);
        }
      }*/

?>