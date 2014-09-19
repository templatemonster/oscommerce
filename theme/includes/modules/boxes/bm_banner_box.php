<?php

	class bm_banner_box
	{
		var $code = 'bm_banner_box';
		var $group = 'boxes';
		var $title;
		var $description;
		var $sort_order;
		var $enabled = false;
		var $pages;
		var $groups;
		
		function bm_banner_box()
		{
			$this->title       = MODULE_BOXES_BANNER_BOX_TITLE;
			$this->description = MODULE_BOXES_BANNER_BOX_DESCRIPTION;
			$this->box_title   = MODULE_BOXES_BANNER_BOX_BOX_TITLE;
			
			if (defined('MODULE_BOXES_BANNER_BOX_STATUS')) {
				$this->sort_order = MODULE_BOXES_BANNER_BOX_SORT_ORDER;
				$this->enabled    = (MODULE_BOXES_BANNER_BOX_STATUS == 'True');
				$this->groups     = MODULE_BOXES_BANNER_BOX_DISPLAY_GROUP;
				$this->pages      = MODULE_BOXES_BANNER_BOX_DISPLAY_PAGES;
				$this->group      = ((MODULE_BOXES_BANNER_BOX_CONTENT_PLACEMENT == 'Left Column') ? 'boxes_column_left' : 'boxes_column_right');
			}
		}
		
		function execute()
		{
			global $oscTemplate;
			$data    = '';
			$execute = false;
			
			// select banners_group to be used
			$new_banner_search = tep_build_banners_group(MODULE_BOXES_BANNER_BOX_DISPLAY_GROUP);
			$sql               = "select banners_id from " . TABLE_BANNERS . " where status = 1 " . $new_banner_search; // " order by banners_sort_order";
			$banners_query     = tep_db_query($sql);
			// if no active banner in the specified banner group then the box will not show
			$banner_cnt        = 0;
			$data1 .= '<ul class="row">';
			while ($banners_all = tep_db_fetch_array($banners_query)) {
				$banner_cnt++;
				$data1 .= '<li class="col-xs-12">' . tep_display_banner('static', $banners_all['banners_id']) . '</li>';
				$execute = true;
			}
			$data1 .= '</ul>';
			$data .= '<div class="banner-box">' . $data1 . '</div>';
			
			if ($execute) {
				$oscTemplate->addBlock($data, $this->group);
			}
		}
		
		function isEnabled()
		{
			return $this->enabled;
		}
		
		function check()
		{
			return defined('MODULE_BOXES_BANNER_BOX_STATUS');
		}
		
		function install()
		{
			tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Content Nivo Slider Module', 'MODULE_BOXES_BANNER_BOX_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
			tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_BANNER_BOX_CONTENT_PLACEMENT', 'Left Column', 'The module should be loaded in the under header or in home content', '6', '1', 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ', now())");
			tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_BANNER_BOX_SORT_ORDER', '9999', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
			tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display banner group.', 'MODULE_BOXES_BANNER_BOX_DISPLAY_GROUP', '', 'select banner group to display. ', '6', '0','tep_cfg_select_banner_group(' , now())");
			tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_BANNER_BOX_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
		}
		
		function remove()
		{
			tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
		}
		
		function keys()
		{
			return array(
				'MODULE_BOXES_BANNER_BOX_STATUS',
				'MODULE_BOXES_BANNER_BOX_CONTENT_PLACEMENT',
				'MODULE_BOXES_BANNER_BOX_DISPLAY_GROUP',
				'MODULE_BOXES_BANNER_BOX_SORT_ORDER',
				'MODULE_BOXES_BANNER_BOX_DISPLAY_PAGES'
			);
		}
	}
?>