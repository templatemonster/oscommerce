<?php

  class h_shopping_cart {
    var $code = 'h_shopping_cart';
    var $group = 'boxes';
    var $title;
    var $description;
    var $sort_order;
    var $enabled = false;
	var $pages;

    function h_shopping_cart() {
      $this->title = MODULE_BOXES_HEADER_SHOPPING_CART_TITLE;
      $this->description = MODULE_BOXES_HEADER_SHOPPING_CART_DESCRIPTION;

      if ( defined('MODULE_BOXES_HEADER_SHOPPING_CART_STATUS') ) {
        $this->sort_order = MODULE_BOXES_HEADER_SHOPPING_CART_SORT_ORDER;
        $this->enabled = (MODULE_BOXES_HEADER_SHOPPING_CART_STATUS == 'True');
		$this->pages = MODULE_BOXES_HEADER_SHOPPING_CART_DISPLAY_PAGES;
        $this->group = ((MODULE_BOXES_HEADER_SHOPPING_CART_CONTENT_PLACEMENT == 'Header Top') ? 'header_top' : 'header');
		$this->dropdown = (MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN == 'True');
      }
    }

    function execute() {
      global $languages_id, $cart, $new_products_id_in_cart, $currencies, $oscTemplate, $new_products_atribute;
	  
	  $request_type = (getenv('HTTPS') == 'on') ? 'SSL' : 'NONSSL';
      $cart_contents_string = '';
	  if($request_type == 'NONSSL'){
		$serv =  HTTP_SERVER; 
	  } else {
		 $serv = HTTPS_SERVER;  
	  }
	  $actual_link = str_replace($serv . DIR_WS_HTTP_CATALOG,'',$serv.$_SERVER['REQUEST_URI']);

	  if(MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN && MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN == 'True') {
		$dropDown = ' dropdown';  
	  }
	  else {
		$dropDown = '';	  
	  }
      if ($cart->count_contents() > 0) {
        $cart_contents_string = '<ul class="infoBoxContents">';
        $products = $cart->get_products();
        for ($i=0, $n=sizeof($products); $i<$n; $i++) {
			// Push all attributes information in an array
		  if (isset($products[$i]['attributes']) && is_array($products[$i]['attributes'])) {
			while (list($option, $value) = each($products[$i]['attributes'])) {

			  $attributes = tep_db_query("select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix
										  from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa
										  where pa.products_id = '" . (int)$products[$i]['id'] . "'
										   and pa.options_id = '" . (int)$option . "'
										   and pa.options_id = popt.products_options_id
										   and pa.options_values_id = '" . (int)$value . "'
										   and pa.options_values_id = poval.products_options_values_id
										   and popt.language_id = '" . (int)$languages_id . "'
										   and poval.language_id = '" . (int)$languages_id . "'");
			  $attributes_values = tep_db_fetch_array($attributes);
	
			  $products[$i][$option]['products_options_name'] = $attributes_values['products_options_name'];
			  $products[$i][$option]['options_values_id'] = $value;
			  $products[$i][$option]['products_options_values_name'] = $attributes_values['products_options_values_name'];
			  $products[$i][$option]['options_values_price'] = $attributes_values['options_values_price'];
			  $products[$i][$option]['price_prefix'] = $attributes_values['price_prefix'];
			}
		  }

          $cart_contents_string .= '<li>'.
		  '<div class="product-image">'.
		  '	<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $products[$i]['id']) . '">'.tep_image(DIR_WS_IMAGES . $products[$i]['image'], $products[$i]['name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT).'</a>'.
		  '</div>'.
		  '<div class="product-info">'.
		  '<span class="cart-counter">';

          if ((tep_session_is_registered('new_products_id_in_cart')) && ($new_products_id_in_cart == $products[$i]['id'])) {
            $cart_contents_string .= '<span class="newItemInCart">';
          }

          		$cart_contents_string .= $products[$i]['quantity'] . ' x ';

          if ((tep_session_is_registered('new_products_id_in_cart')) && ($new_products_id_in_cart == $products[$i]['id'])) {
            $cart_contents_string .= '</span>';
          }

          $cart_contents_string .= '</span><span class="cart-product-name"><a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $products[$i]['id']) . '">';

          if ((tep_session_is_registered('new_products_id_in_cart')) && ($new_products_id_in_cart == $products[$i]['id'])) {
            $cart_contents_string .= '<span class="newItemInCart">';
          }

          $cart_contents_string .= $products[$i]['name'];
		  if (isset($products[$i]['attributes']) && is_array($products[$i]['attributes'])) {
			reset($products[$i]['attributes']);
			while (list($option, $value) = each($products[$i]['attributes'])) {
			  $cart_contents_string .= '<br /><small><i> - ' . $products[$i][$option]['products_options_name'] . ' ' . $products[$i][$option]['products_options_values_name'] . '</i></small>';
			}
		  }

          if ((tep_session_is_registered('new_products_id_in_cart')) && ($new_products_id_in_cart == $products[$i]['id'])) {
            $cart_contents_string .= '</span>';
          }

          $cart_contents_string .= '</a></span><span class="price">'. $currencies->display_price($products[$i]['final_price'], tep_get_tax_rate($products[$i]['tax_class_id']), $products[$i]['quantity']) .'</span>'.
		  '<a class="remove" href="' . tep_href_link(FILENAME_SHOPPING_CART, 'products_id=' . $products[$i]['id'] .'&action=remove_cart_product&actual_link=' . $actual_link . '') . '">' .tep_draw_icon('fa-times-circle'). '</a></div></li>';

          if ((tep_session_is_registered('new_products_id_in_cart')) && ($new_products_id_in_cart == $products[$i]['id'])) {
            tep_session_unregister('new_products_id_in_cart');
          }
        }

        $cart_contents_string .= '</ul>'.
						'<div class="total price"><span class="total-text">'.MODULE_BOXES_HEADER_SHOPPING_CART_SUB_TOTAL.'</span><span class="total-price">' . $currencies->format($cart->show_total()) . '</span></div>'.
						'<div class="cart-button">'. tep_draw_button(HEADER_TITLE_CART_CONTENTS, 'btn btn-default', tep_href_link(FILENAME_SHOPPING_CART, '', 'SSL')).'</div>';
		if ($cart->count_contents() > 1){
			$productCount = $cart->count_contents() .' '.MODULE_BOXES_HEADER_SHOPPING_CART_BOX_ITEMS;
		}
		else {
			$productCount = $cart->count_contents() .' '. MODULE_BOXES_HEADER_SHOPPING_CART_BOX_ITEM;	
		}
      } else {
		$productCount = MODULE_BOXES_HEADER_SHOPPING_CART_BOX_CART_EMPTY;
        $cart_contents_string .= '<div class="infoBoxContents">' . MODULE_BOXES_HEADER_SHOPPING_CART_BOX_CART_EMPTY . '</div>';
      }

      $data .= '<div class="header-shopping-cart'.$dropDown.'">' .
              '  <h3><a href="' . tep_href_link(FILENAME_SHOPPING_CART) . '">' . MODULE_BOXES_HEADER_SHOPPING_CART_BOX_TITLE . '<span class="productCount">'.$productCount.'</span></a></h3>' .
              '  <div class="cart-content">' . $cart_contents_string . '</div>'.
              '</div>';
	  
	  if(MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN && MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN == 'True') {
		$data .="<script type='text/javascript'>
					$('.dropdown h3 a').on('click', function(){
						if($('.dropdown .cart-content').is(':hidden')) {
							$('.dropdown .cart-content').show();	
							$(this).addClass('active');
						} else {
							$('.dropdown .cart-content').hide();
							$(this).removeClass('active');	
						}
						return false;
					});
					$(document).on('click', function(e){
						$('.dropdown .cart-content').hide();
						$('.dropdown h3 a').removeClass('active');	
					});
					$('.dropdown .cart-content').on('click', function(e){
						e.stopPropagation();
					});
				</script>";	  
	  }
		if($new_products_id_in_cart) {
			
			$popUpContent = '';
			$product = $cart->get_popup_product($new_products_id_in_cart, $new_products_atribute);
			
			$popUpContent ='';
			$popUpContent .= '<div class="popup-container">'.
							 '	<div class="popup-heading">'.MODULE_BOXES_HEADER_SHOPPING_CART_SUCCESS.'</div>'.
							 '	<div class="product-image">'.
							 '		<a href="'.tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $product['id']).'">'.tep_image(DIR_WS_IMAGES . $product['image'], $product['name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT).'</a>'.
							 '	</div>'.
							 '	<div class="product-info">'.
							 '		<a class="product-name" href="'.tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $product['id']).'">'.$product['name'].'</a>'.
							 '		<div class="price">'.$currencies->display_price($product['final_price'], tep_get_tax_rate($product['tax_class_id'])).'</div>'.
							 '		<div class="popup-button">'. tep_draw_button(HEADER_TITLE_CART_CONTENTS, 'btn btn-default', tep_href_link(FILENAME_SHOPPING_CART, '', 'SSL')).'</div>'.
							 '	</div>'.
							 '</div>';
			

			
	  		$data.=  "<script type='text/javascript'>
					content = '".$popUpContent."';
					$(document).ready(function(){
						$.fancybox({
							'type': 'html',
							'content' : content
						})
					})
					</script>";
	  }

      $oscTemplate->addBlock($data, $this->group);
    }

    function isEnabled() {
      return $this->enabled;
    }

    function check() {
      return defined('MODULE_BOXES_HEADER_SHOPPING_CART_STATUS');
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Header Shopping Cart Module', 'MODULE_BOXES_HEADER_SHOPPING_CART_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Content Placement', 'MODULE_BOXES_HEADER_SHOPPING_CART_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the Header or Header top position?', '6', '1', 'tep_cfg_select_option(array(\'Header Top\', \'Header\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort Order', 'MODULE_BOXES_HEADER_SHOPPING_CART_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Dropdown cart', 'MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN', 'True', 'Disable/Enable dropdown Header Shopping Cart. ', '6', '0','tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
	  tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Display in pages.', 'MODULE_BOXES_HEADER_SHOPPING_CART_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', '6', '0','tep_cfg_select_pages(' , now())");
    }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_BOXES_HEADER_SHOPPING_CART_STATUS', 'MODULE_BOXES_HEADER_SHOPPING_CART_CONTENT_PLACEMENT', 'MODULE_BOXES_HEADER_SHOPPING_CART_SORT_ORDER', 'MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN','MODULE_BOXES_HEADER_SHOPPING_CART_DISPLAY_PAGES');
    }
  }
?>
