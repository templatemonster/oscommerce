<?php

  class f_social {
    var $code = 'f_social';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
    var $pages;	

    function f_social() {
      $this->title = MODULE_BOXES_SOCIAL_TITLE;
      $this->description = MODULE_BOXES_SOCIAL_DESCRIPTION;

      if ( defined('MODULE_BOXES_SOCIAL_STATUS') ) {
        $this->sort_order = MODULE_BOXES_SOCIAL_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_SOCIAL_STATUS == 'True');
        $this->pages = MODULE_BOXES_SOCIAL_DISPLAY_PAGES;
        $this->group = 'boxes_footer';
      }
    }

    function execute() {
      global $oscTemplate;
	  
	    $data = '<div class="footer-box col-xs-3">' . 
              '  <h4>' . MODULE_BOXES_SOCIAL_BOX_TITLE . '</h4>' .
			  '  <ul>';
			  
			  if(MODULE_BOXES_SOCIAL_BOX_FACEBOOK && MODULE_BOXES_SOCIAL_BOX_FACEBOOK !='')
              	$data .='<li class="facebook"><a href="'.MODULE_BOXES_SOCIAL_BOX_FACEBOOK.'">'. MODULE_BOXES_SOCIAL_BOX_FACEBOOK_LI . '</a></li>';
			  if(MODULE_BOXES_SOCIAL_BOX_TWITTER && MODULE_BOXES_SOCIAL_BOX_TWITTER !='')
              	$data .='<li class="twitter"><a href="'.MODULE_BOXES_SOCIAL_BOX_TWITTER.'">' . MODULE_BOXES_SOCIAL_BOX_TWITTER_LI . '</a></li>';
			  if(MODULE_BOXES_SOCIAL_BOX_RSS && MODULE_BOXES_SOCIAL_BOX_RSS !='')
			  	$data .='<li class="rss"><a href="'.MODULE_BOXES_SOCIAL_BOX_RSS.'">' . MODULE_BOXES_SOCIAL_BOX_RSS_LI . '</a></li>';
			  if(MODULE_BOXES_SOCIAL_BOX_YOUTUBE && MODULE_BOXES_SOCIAL_BOX_YOUTUBE !='')
			  	$data .='<li class="youtube"><a href="'.MODULE_BOXES_SOCIAL_BOX_YOUTUBE.'">' . MODULE_BOXES_SOCIAL_BOX_YUOTUBE_LI . '</a></li>';
			  if(MODULE_BOXES_SOCIAL_BOX_GOOGLE && MODULE_BOXES_SOCIAL_BOX_GOOGLE !='')
              	$data .='<li class="google-pluse"><a href="'.MODULE_BOXES_SOCIAL_BOX_GOOGLE.'">' . MODULE_BOXES_SOCIAL_BOX_GOOGLE_LI . '</a></li>';
			  $data .='</ul>';
			  $data .='</div>';

      $oscTemplate->addBlock($data, $this->group);
    }

    function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_SOCIAL_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Information Module', 'MODULE_BOXES_SOCIAL_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_SOCIAL_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_SOCIAL_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");	  	  
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_SOCIAL_STATUS', 'MODULE_BOXES_SOCIAL_SORT_ORDER', 'MODULE_BOXES_SOCIAL_DISPLAY_PAGES');
    }
  }
?>
