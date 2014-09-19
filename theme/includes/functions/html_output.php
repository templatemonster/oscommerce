<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

/**
  * ULTIMATE Seo Urls 5 PRO by FWR Media
  * Replacement for osCommerce href link wrapper function
  */
  require_once DIR_WS_MODULES . 'ultimate_seo_urls5/main/usu5.php';
  
  function tep_href_link( $page = '', $parameters = '', $connection = 'NONSSL', $add_session_id = true, $search_engine_safe = true ) {
    return Usu_Main::i()->hrefLink( $page, $parameters, $connection, $add_session_id, $search_engine_safe );
  }

////
// The HTML image wrapper function
  function tep_image($src, $alt = '', $width = '', $height = '', $parameters = '', $imageClass = '') {
    if ( (empty($src) || ($src == DIR_WS_IMAGES)) && (IMAGE_REQUIRED == 'false') ) {
      return false;
    }
	if ($imageClass) {
		$imageClass = 'class="'.$imageClass.'"';
	}
// alt is added to the img tag even if it is null to prevent browsers from outputting
// the image filename as default
    $image = '<img '.$imageClass.' src="' . tep_output_string($src) . '" alt="' . tep_output_string($alt) . '"';

    if (tep_not_null($alt)) {
      $image .= ' title="' . tep_output_string($alt) . '"';
    }

    if ( (CONFIG_CALCULATE_IMAGE_SIZE == 'true') && (empty($width) || empty($height)) ) {
      if ($image_size = @getimagesize($src)) {
        if (empty($width) && tep_not_null($height)) {
          $ratio = $height / $image_size[1];
          $width = intval($image_size[0] * $ratio);
        } elseif (tep_not_null($width) && empty($height)) {
          $ratio = $width / $image_size[0];
          $height = intval($image_size[1] * $ratio);
        } elseif (empty($width) && empty($height)) {
          $width = $image_size[0];
          $height = $image_size[1];
        }
      } elseif (IMAGE_REQUIRED == 'false') {
        return false;
      }
    }

    if (tep_not_null($width) && tep_not_null($height)) {
      $image .= ' width="' . tep_output_string($width) . '" height="' . tep_output_string($height) . '"';
    }

    if (tep_not_null($parameters)) $image .= ' ' . $parameters;

    $image .= ' />';

    return $image;
  }

////
// The HTML form submit button wrapper function
// Outputs a button in the selected language
  function tep_image_submit($image, $alt = '', $parameters = '') {
    global $language;

    $image_submit = '<button class="btn btn-default" type="submit"><i class="'.$image.'"></i></button>';

    return $image_submit;
  }

////
// Output a function button in the selected language
  function tep_image_button($image, $alt = '', $parameters = '') {
    global $language;

    return tep_image(DIR_WS_LANGUAGES . $language . '/images/buttons/' . $image, $alt, '', '', $parameters);
  }

////
// Output a separator either through whitespace, or with an image
  function tep_draw_separator($image = 'pixel_black.gif', $width = '100%', $height = '1') {
    return tep_image(DIR_WS_IMAGES . $image, '', $width, $height);
  }

////
// Output a form
  function tep_draw_form($name, $action, $method = 'post', $parameters = '', $tokenize = false, $className = '') {
    global $sessiontoken;

    $form = '<form class="form-group'.$className.'" name="' . tep_output_string($name) . '" action="' . tep_output_string($action) . '" method="' . tep_output_string($method) . '"';

    if (tep_not_null($parameters)) $form .= ' ' . $parameters;

    $form .= '>';

    if ( ($tokenize == true) && isset($sessiontoken) ) {
      $form .= '<input type="hidden" name="formid" value="' . tep_output_string($sessiontoken) . '" />';
    }

    return $form;
  }
  
  // Output a  inline form
  function tep_draw_inline_form($name, $action, $method = 'post', $parameters = '', $tokenize = false) {
    global $sessiontoken;

    $form = '<div class="form-inline"><form class="form-group" name="' . tep_output_string($name) . '" action="' . tep_output_string($action) . '" method="' . tep_output_string($method) . '"';

    if (tep_not_null($parameters)) $form .= ' ' . $parameters;

    $form .= '>';

    if ( ($tokenize == true) && isset($sessiontoken) ) {
      $form .= '<input type="hidden" name="formid" value="' . tep_output_string($sessiontoken) . '" />';
    }

    return $form;
  }

////
// Output a form input field
  function tep_draw_input_field($name, $value = '', $parameters = '', $type = 'text', $reinsert_value = true) {
    global $HTTP_GET_VARS, $HTTP_POST_VARS;

    $field = '<input class="form-control" type="' . tep_output_string($type) . '" name="' . tep_output_string($name) . '"';

    if ( ($reinsert_value == true) && ( (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) || (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) ) ) {
      if (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) {
        $value = stripslashes($HTTP_GET_VARS[$name]);
      } elseif (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) {
        $value = stripslashes($HTTP_POST_VARS[$name]);
      }
    }

    if (tep_not_null($value)) {
      $field .= ' value="' . tep_output_string($value) . '"';
    }

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= ' />';

    return $field;
  }

////
// Output a form password field
  function tep_draw_password_field($name, $value = '', $parameters = 'maxlength="40"') {
    return tep_draw_input_field($name, $value, $parameters, 'password', false);
  }

////
// Output a selection field - alias function for tep_draw_checkbox_field() and tep_draw_radio_field()
  function tep_draw_selection_field($name, $type, $value = '', $checked = false, $parameters = '') {
    global $HTTP_GET_VARS, $HTTP_POST_VARS;

    $selection = '<input type="' . tep_output_string($type) . '" name="' . tep_output_string($name) . '"';

    if (tep_not_null($value)) $selection .= ' value="' . tep_output_string($value) . '"';

    if ( ($checked == true) || (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name]) && (($HTTP_GET_VARS[$name] == 'on') || (stripslashes($HTTP_GET_VARS[$name]) == $value))) || (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name]) && (($HTTP_POST_VARS[$name] == 'on') || (stripslashes($HTTP_POST_VARS[$name]) == $value))) ) {
      $selection .= ' checked="checked"';
    }

    if (tep_not_null($parameters)) $selection .= ' ' . $parameters;

    $selection .= ' />';

    return $selection;
  }

////
// Output a form checkbox field
  function tep_draw_checkbox_field($name, $value = '', $checked = false, $parameters = '') {
    return tep_draw_selection_field($name, 'checkbox', $value, $checked, $parameters);
  }

////
// Output a form radio field
  function tep_draw_radio_field($name, $value = '', $checked = false, $parameters = '') {
    return tep_draw_selection_field($name, 'radio', $value, $checked, $parameters);
  }

////
// Output a form textarea field
// The $wrap parameter is no longer used in the core xhtml template
  function tep_draw_textarea_field($name, $wrap, $width, $height, $text = '', $parameters = '', $reinsert_value = true) {
    global $HTTP_GET_VARS, $HTTP_POST_VARS;

    $field = '<textarea class="form-control" name="' . tep_output_string($name) . '" cols="' . tep_output_string($width) . '" rows="' . tep_output_string($height) . '"';

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= '>';

    if ( ($reinsert_value == true) && ( (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) || (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) ) ) {
      if (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) {
        $field .= tep_output_string_protected(stripslashes($HTTP_GET_VARS[$name]));
      } elseif (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) {
        $field .= tep_output_string_protected(stripslashes($HTTP_POST_VARS[$name]));
      }
    } elseif (tep_not_null($text)) {
      $field .= tep_output_string_protected($text);
    }

    $field .= '</textarea>';

    return $field;
  }

////

// Output a form hidden field
  function tep_draw_hidden_field($name, $value = '', $parameters = '') {
    global $HTTP_GET_VARS, $HTTP_POST_VARS;

    $field = '<input type="hidden" name="' . tep_output_string($name) . '"';

    if (tep_not_null($value)) {
      $field .= ' value="' . tep_output_string($value) . '"';
    } elseif ( (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) || (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) ) {
      if ( (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) ) {
        $field .= ' value="' . tep_output_string(stripslashes($HTTP_GET_VARS[$name])) . '"';
      } elseif ( (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) ) {
        $field .= ' value="' . tep_output_string(stripslashes($HTTP_POST_VARS[$name])) . '"';
      }
    }

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= ' />';

    return $field;
  }

////

	function tep_addcart_popup($productId){
		$output = '
			<script type="text/javascript">
				$(document).ready(function(){
					alert("'.$productId.'");	
				})
			</script>
		';
		echo $output;	
	}
// Hide form elements
  function tep_hide_session_id() {
    global $session_started, $SID;

    if (($session_started == true) && tep_not_null($SID)) {
      return tep_draw_hidden_field(tep_session_name(), tep_session_id());
    }
  }

////
// Output a form pull down menu
  function tep_draw_pull_down_menu($name, $values, $default = '', $parameters = '', $required = false) {
    global $HTTP_GET_VARS, $HTTP_POST_VARS;

    $field = '<select class="form-control" name="' . tep_output_string($name) . '"';

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= '>';

    if (empty($default) && ( (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) || (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) ) ) {
      if (isset($HTTP_GET_VARS[$name]) && is_string($HTTP_GET_VARS[$name])) {
        $default = stripslashes($HTTP_GET_VARS[$name]);
      } elseif (isset($HTTP_POST_VARS[$name]) && is_string($HTTP_POST_VARS[$name])) {
        $default = stripslashes($HTTP_POST_VARS[$name]);
      }
    }

    for ($i=0, $n=sizeof($values); $i<$n; $i++) {
      $field .= '<option value="' . tep_output_string($values[$i]['id']) . '"';
      if ($default == $values[$i]['id']) {
        $field .= ' selected="selected"';
      }

      $field .= '>' . tep_output_string($values[$i]['text'], array('"' => '&quot;', '\'' => '&#039;', '<' => '&lt;', '>' => '&gt;')) . '</option>';
    }
    $field .= '</select>';

    if ($required == true) $field .= TEXT_FIELD_REQUIRED;

    return $field;
  }

////
// Creates a pull-down list of countries
  function tep_get_country_list($name, $selected = '', $parameters = '') {
    $countries_array = array(array('id' => '', 'text' => PULL_DOWN_DEFAULT));
    $countries = tep_get_countries();

    for ($i=0, $n=sizeof($countries); $i<$n; $i++) {
      $countries_array[] = array('id' => $countries[$i]['countries_id'], 'text' => $countries[$i]['countries_name']);
    }

    return tep_draw_pull_down_menu($name, $countries_array, $selected, $parameters);
  }

////
// Output a jQuery UI Button
  function tep_draw_button($title = null, $icon = null, $link = null, $priority = null, $params = null) {
    static $button_counter = 1;

    $types = array('submit', 'button', 'reset');

    if ( !isset($params['type']) ) {
      $params['type'] = 'submit';
    }

    if ( !in_array($params['type'], $types) ) {
      $params['type'] = 'submit';
    }

    if ( ($params['type'] == 'submit') && isset($link) ) {
      $params['type'] = 'button';
    }

    if (!isset($priority)) {
      $priority = 'secondary';
    }

    $button = '';

    if ( ($params['type'] == 'button') && isset($link) ) {
      $button .= '<a id="tdb' . $button_counter . '" class="'.$icon.'" href="' . $link . '"';

      if ( isset($params['newwindow']) ) {
        $button .= ' target="_blank"';
      }
    } else {
      $button .= '<button id="tdb' . $button_counter . '" class="'.$icon.'" type="' . tep_output_string($params['type']) . '"';
    }

    if ( isset($params['params']) ) {
      $button .= ' ' . $params['params'];
    }

    $button .= '>' . $title;

    if ( ($params['type'] == 'button') && isset($link) ) {
      $button .= '</a>';
    } else {
      $button .= '</button>';
    }
    $button_counter++;

    return $button;
  }
  
  function tep_draw_icon($iconName)
  {
	$icon = '';
  	$icon .= '<i class="fa '.$iconName.'"></i>';
	return $icon;
  }
  
  function tep_draw_rating($rating){
	$output ='<ul class="rating">';
	for ($i=0; $i < $rating; $i++) {
		$output .='<li><i class="fa fa-star"></i></li>';
	}
	for ($i=0; $i < (5-$rating); $i++) {
		$output .='<li><i class="fa fa-star-o"></i></li>';
	}
	$output .='</ul>';
	return $output;
  }
  
  
  // The HTML image wrapper function
  function tep_caroucel_image($src, $srcThumb, $alt = '', $width = '', $height = '', $imageClass = '') {
    if ( (empty($src) || ($src == DIR_WS_IMAGES)) && (IMAGE_REQUIRED == 'false') ) {
      return false;
    }
	if ($imageClass) {
		$imageClass = 'class="'.$imageClass.'"';
	}
// alt is added to the img tag even if it is null to prevent browsers from outputting
// the image filename as default
    $image = '<img '.$imageClass.' src="' . tep_output_string($src) . '" data-zoom-image="' . tep_output_string($src) . '" alt="' . tep_output_string($alt) . '"';

    if (tep_not_null($alt)) {
      $image .= ' title="' . tep_output_string($alt) . '"';
    }

    if ( (CONFIG_CALCULATE_IMAGE_SIZE == 'true') && (empty($width) || empty($height)) ) {
      if ($image_size = @getimagesize($src)) {
        if (empty($width) && tep_not_null($height)) {
          $ratio = $height / $image_size[1];
          $width = intval($image_size[0] * $ratio);
        } elseif (tep_not_null($width) && empty($height)) {
          $ratio = $width / $image_size[0];
          $height = intval($image_size[1] * $ratio);
        } elseif (empty($width) && empty($height)) {
          $width = $image_size[0];
          $height = $image_size[1];
        }
      } elseif (IMAGE_REQUIRED == 'false') {
        return false;
      }
    }

    if (tep_not_null($width) && tep_not_null($height)) {
      $image .= ' width="' . tep_output_string($width) . '" height="' . tep_output_string($height) . '"';
    }

    $image .= ' />';

    return $image;
  }
  	// function for grid/list changes
  	function tep_gridlist_build() {
		$content ='';
		$content .= '<script type="text/javascript" src="ext/gridlist/gridlist.js"></script>
					<script type="text/javascript">
						$(document).ready(function() {
							defaultView = "'.LISTING_VIEW_TYPE.'";
							bindGrid(defaultView);
						});
					</script>';
		$content .= '<ul id="view">
						<li id="list"><i class="fa fa-list"></i></li>
						<li id="grid"><i class="fa fa-th-large"></i></li>
					</ul><div class="clearfix"></div>';
		return $content;
	}
  	// function for products-box building
	function tep_product_block_build($productId ='', $productImage ='', $productName ='', $productAdded ='', $productManufacturerId ='', $productManufacturerName ='', $productPrice ='', $productPriceNew ='', $productWeight ='', $productQuantity ='', $productModel, $productDescription, $productButtons = false, $pageComming = FILENAME_DEFAULT, $elCount = 0){
		global $oscTemplate;
		
		if ($elCount%$oscTemplate->getProductPerLine() == 1) {
			$clear =' first-in-line';	
		} else {
			$clear ='';	
		}
		
		$prodClearNum = $oscTemplate->getProductPerLine();
		
		$content ='';
		$content .= '<li class="col-xs-'.$oscTemplate->getProductWidth().$clear.'"><div class="product-container">';
		
		if ($productImage && PRODUCT_LIST_IMAGE > 0) {
			$content .= '<div class="product-image-box">'.
						'	<a class="product-image" href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $productId) . '">'. tep_image(DIR_WS_IMAGES . $productImage, $productName, HOMEPAGE_IMAGE_WIDTH, HOMEPAGE_IMAGE_HEIGHT,'').'</a>'.
						'</div>';
		}
		
		$content .= '<div class="product-content">';
		
		if ($productName && PRODUCT_LIST_NAME > 0) {
			$content .= '<a class="product-name listing" href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $productId) . '">'.$productName.'</a>';
		}
		
		if ($productManufacturerName && PRODUCT_LIST_MANUFACTURER > 0) {
			$content .= '<div class="info-manufacturer product-info-row"><span class="info-text">'.TEXT_MANUFACTURER.'</span><span class="manufacturer-name"><a href="' . tep_href_link(FILENAME_DEFAULT, 'manufacturers_id=' . $productManufacturerId) . '">'. $productManufacturerName .'</a></span></div>';
		}
		if ($productAdded) {
			$content .= '<div class="date-added product-info-row"><span class="info-text">'.TEXT_DATE_ADDED.'</span><span class="date">'. tep_date_long($productAdded) .'</span></div>';	
		}
		
		if($productPrice && PRODUCT_LIST_PRICE > 0) {
			if ($productPriceNew) {
				$productPrice = '<span class="new-price price">'.$productPriceNew.'</span> <del class="old-price price">'.$productPrice.'</del>';	
			} else {
				$productPrice = '<span class="price">'.$productPrice.'</span>';	
			}
			$content .='<div class="info-price product-info-row"><span class="info-text">'.TEXT_PRICE.'</span><span class="product-price">' . $productPrice . '</span></div>';
		}
		
		if($productWeight && PRODUCT_LIST_WEIGHT > 0) {
			$content .='<div class="info-weight product-info-row"><span class="info-text">'.TABLE_HEADING_WEIGHT.'</span><span class="weight">' . $productWeight . '</span></div>';	
		}
		
		if($productQuantity && PRODUCT_LIST_QUANTITY > 0) {
			$content .='<div class="info-quantity product-info-row"><span class="info-text">'.TABLE_HEADING_QUANTITY.'</span><span class="quantity">' . $productQuantity . '</span></div>';
		}
		
		if($productModel && PRODUCT_LIST_MODEL > 0) {
			$content .='<div class="info-model product-info-row"><span class="info-text">' . TABLE_HEADING_MODEL . '</span><span class="model">' . $productModel . '</span></div>';	
		}
		
		if($productDescription) {
			$content .= $productDescription;
		}
		
		$content .= '</div>';
		
		if($productButtons && PRODUCT_LIST_BUY_NOW > 0) {
			$content .='<div class="button-container">'.tep_draw_button(IMAGE_BUTTON_IN_CART, 'cart btn btn-primary', tep_href_link($pageComming, tep_get_all_get_params(array('action')) . 'action=buy_now&products_id=' . $productId)) .' '.tep_draw_button(SMALL_IMAGE_BUTTON_VIEW, 'info btn btn-default', tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $productId)).'</div>';	
		}
	
		$content .= '	</div></li>';
		return $content;
	}
?>