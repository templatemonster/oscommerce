<?php

  class bm_tag {


    var $code = 'bm_tag';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
	var $pages;

    function bm_tag() {
      $this->title = MODULE_BOXES_TAG_TITLE;
      $this->description = MODULE_BOXES_TAG_DESCRIPTION;

      if ( defined('MODULE_BOXES_TAG_STATUS') ) {
           
        $this->sort_order = MODULE_BOXES_TAG_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_TAG_STATUS == 'True');
		$this->pages = MODULE_BOXES_TAG_DISPLAY_PAGES;
        $this->group = ((MODULE_BOXES_TAG_CONTENT_PLACEMENT == 'Left Column') ? 'boxes_column_left' : 'boxes_column_right');
      }
    }

    function execute() {
      global $HTTP_GET_VARS, $languages_id, $currencies, $oscTemplate;
	  $tags_query = tep_db_query("select p.tag_id, t.tag_text, count(*) from ". TABLE_PRODUCTS_TAGS ." p, ". TABLE_TAGS ." t where p.tag_id = t.tag_id group by p.tag_id order by count(*) desc limit 15" );
	  if(tep_db_num_rows($tags_query) > 1) {
		  $data ='';
	
		  $data.='<div class="module tags-box">
					<h3 class="module-heading">'. MODULE_BOXES_TAG_TITLE .'</h3>
					<div class="module-content">';	
		  while ($tags = tep_db_fetch_array($tags_query)) {
			$data.= '<a href="' . tep_href_link(FILENAME_TAG_PRODUCTS) .'?id_tag='.$tags['tag_id'].'" class="weight_'.$tags['count(*)'].'">'.urldecode($tags['tag_text']).'</a>';
		  }
	
		  $data.='</div></div>';
	
		  $oscTemplate->addBlock($data, $this->group);
    	}
	}

    function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_TAG_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Specials Module', 'MODULE_BOXES_TAG_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_TAG_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_TAG_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_TAG_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_TAG_STATUS', 'MODULE_BOXES_TAG_CONTENT_PLACEMENT', 'MODULE_BOXES_TAG_SORT_ORDER', 'MODULE_BOXES_TAG_DISPLAY_PAGES');
    }
  }
?>
