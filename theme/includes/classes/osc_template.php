<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2014 osCommerce

  Released under the GNU General Public License
*/

  class oscTemplate {
    var $_title;
    var $_blocks = array();
    var $_content = array();
    var $_grid_container_width = 12;
    var $_grid_content_width = 6;
    var $_grid_column_width = 3;
	var $_prod_per_line = 4;
    var $_data = array();

    function oscTemplate() {
      $this->_title = TITLE;
    }

    function setGridContainerWidth($width) {
      $this->_grid_container_width = $width;
    }

    function getGridContainerWidth() {
      return $this->_grid_container_width;
    }

    function setGridContentWidth($width) {
      $this->_grid_content_width = $width;
    }

    function getGridContentWidth() {
      return $this->_grid_content_width;
    }

    function setGridColumnWidth($width) {
      $this->_grid_column_width = $width;
    }

    function getGridColumnWidth() {
      return $this->_grid_column_width;
    }
	function getProductPerLine() {
      return $this->_prod_per_line;
    }
	function setProductPerLine($col) {
      $this->_prod_per_line = $col;
    }
	
	function getProductWidth() {
      return 12/$this->getProductPerLine();
    }
	
    function setTitle($title) {
      $this->_title = $title;
    }

    function getTitle() {
      return $this->_title;
    }

    function addBlock($block, $group) {
     	$this->_blocks[$group][] = $block;
    }

    function hasBlocks($group) {
      return (isset($this->_blocks[$group]) && !empty($this->_blocks[$group]));
    }

    function getBlocks($group) {
      if ($this->hasBlocks($group)) {
        return implode("\n", $this->_blocks[$group]);
      }
    }

    function buildBlocks() {
      global $language, $PHP_SELF, $current_page;

      if ( defined('TEMPLATE_BLOCK_GROUPS') && tep_not_null(TEMPLATE_BLOCK_GROUPS) ) {
        $tbgroups_array = explode(';', TEMPLATE_BLOCK_GROUPS);

        foreach ($tbgroups_array as $group) {
          $module_key = 'MODULE_' . strtoupper($group) . '_INSTALLED';

          if ( defined($module_key) && tep_not_null(constant($module_key)) ) {
            $modules_array = explode(';', constant($module_key));

            foreach ( $modules_array as $module ) {
              $class = substr($module, 0, strrpos($module, '.'));

              if ( !class_exists($class) ) {
                include(DIR_WS_LANGUAGES . $language . '/modules/' . $group . '/' . $module);
                include(DIR_WS_MODULES . $group . '/' . $class . '.php');
              }

              $mb = new $class();

				if(!$current_page)
					$current_page = $PHP_SELF;
              // bof Dynamic Template System
              if(!isset($mb->pages) && ($mb->isEnabled())){
                $this->pages = 'all';              
                $mb->execute();              
                }else{              
              if(($mb->isEnabled()) && (($mb->pages === 'all') || (in_array($current_page, explode(';' , $mb->pages))))){
                $mb->execute();
                }
              }
              // eof Dynamic Template System
            }
          }
        }
      }
    }

    function addContent($content, $group) {
      $this->_content[$group][] = $content;
    }

    function hasContent($group) {
      return (isset($this->_content[$group]) && !empty($this->_content[$group]));
    }

    function getContent($group) {
      global $language, $PHP_SELF;

      if ( !class_exists('tp_' . $group) && file_exists(DIR_WS_MODULES . 'pages/tp_' . $group . '.php') ) {
        include(DIR_WS_MODULES . 'pages/tp_' . $group . '.php');
      }

      if ( class_exists('tp_' . $group) ) {
        $template_page_class = 'tp_' . $group;
        $template_page = new $template_page_class();
        $template_page->prepare();
      }

      foreach ( $this->getContentModules($group) as $module ) {
        if ( !class_exists($module) ) {
          if ( file_exists(DIR_WS_MODULES . 'content/' . $group . '/' . $module . '.php') ) {
            if ( file_exists(DIR_WS_LANGUAGES . $language . '/modules/content/' . $group . '/' . $module . '.php') ) {
              include(DIR_WS_LANGUAGES . $language . '/modules/content/' . $group . '/' . $module . '.php');
            }

            include(DIR_WS_MODULES . 'content/' . $group . '/' . $module . '.php');
          }
        }

        if ( class_exists($module) ) {
          $mb = new $module();
			if($group != 'login' && $group !='account' && $group !='checkout_success') {
			  // bof Dynamic Template System
			  if(($mb->pages === 'all' && $mb->pages !== 'null') || in_array($PHP_SELF , explode(';' , $mb->pages))){
				$mb->execute();
			  }
			  // eof Dynamic Template System
			} else {
				$mb->execute();	
			}
        }
      }

      if ( class_exists('tp_' . $group) ) {
        $template_page->build();
      }

      if ($this->hasContent($group)) {
        return implode("\n", $this->_content[$group]);
      }
    }

    function getContentModules($group) {
      $result = array();

      foreach ( explode(';', MODULE_CONTENT_INSTALLED) as $m ) {
        $module = explode('/', $m, 2);

        if ( $module[0] == $group ) {
          $result[] = $module[1];
        }
      }

      return $result;
    }
  }
?>
