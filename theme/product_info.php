<?php
  require('includes/application_top.php');

  if (!isset($HTTP_GET_VARS['products_id'])) {
    tep_redirect(tep_href_link(FILENAME_DEFAULT));
  }

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PRODUCT_INFO);

  $product_check_query = tep_db_query("select count(*) as total from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pd.products_id = p.products_id and pd.language_id = '" . (int)$languages_id . "'");
  $product_check = tep_db_fetch_array($product_check_query);

  require(DIR_WS_INCLUDES . 'template_top.php');

  if ($product_check['total'] < 1) {
?>

<div class="alert alert-warning"> <?php echo TEXT_PRODUCT_NOT_FOUND; ?> </div>
<div class="bottom-navigation"> <?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'btn btn-default pull-right', tep_href_link(FILENAME_DEFAULT)); ?> </div>
<?php
  } else {
    $product_info_query = tep_db_query("select p.products_id, pd.products_name, pd.products_description, p.products_model, p.products_quantity, p.products_image, pd.products_url, p.products_price, p.products_tax_class_id, p.products_date_added, p.products_date_available, p.manufacturers_id from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pd.products_id = p.products_id and pd.language_id = '" . (int)$languages_id . "'");
    $product_info = tep_db_fetch_array($product_info_query);

    tep_db_query("update " . TABLE_PRODUCTS_DESCRIPTION . " set products_viewed = products_viewed+1 where products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and language_id = '" . (int)$languages_id . "'");

    if ($new_price = tep_get_products_special_price($product_info['products_id'])) {
      $products_price = '	<span class="productSpecialPrice price new-price">' . $currencies->display_price($new_price, tep_get_tax_rate($product_info['products_tax_class_id'])) . '</span>'.
	  					'	<del class="old-price price">' . $currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id'])) . '</del>';
    } else {
      $products_price = '<span class="price">'.$currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id'])).'</span>';
    }

    if (tep_not_null($product_info['products_model'])) {
      $products_name = $product_info['products_name'] . '<span class="productModel">[' . $product_info['products_model'] . ']</span>';
    } else {
      $products_name = $product_info['products_name'];
    }
?>
<?php echo tep_draw_form('cart_quantity', tep_href_link(FILENAME_PRODUCT_INFO, tep_get_all_get_params(array('action')) . 'action=add_product')); ?>
<div class="product-info row">
  <div id="productImage" class="col-xs-4">
    <?php
        if (tep_not_null($product_info['products_image'])) {
          $photoset_layout = '1';
    
          $pi_query = tep_db_query("select image, htmlcontent from " . TABLE_PRODUCTS_IMAGES . " where products_id = '" . (int)$product_info['products_id'] . "' order by sort_order");
          $pi_total = tep_db_num_rows($pi_query);
    
          if ($pi_total > 0) {
            $pi_sub = $pi_total-1;
    
            while ($pi_sub > 5) {
              $photoset_layout .= 5;
              $pi_sub = $pi_sub-5;
            }
    
            if ($pi_sub > 0) {
              $photoset_layout .= ($pi_total > 5) ? 5 : $pi_sub;
            }
    ?>
    <div id="piGal" class="gallery"> <div class="product-img-wrap"><?php echo tep_caroucel_image(DIR_WS_IMAGES . $product_info['products_image'], addslashes($product_info['products_name']),'', PRODUCTINFO_IMAGE_WIDTH, PRODUCTINFO_IMAGE_HEIGHT, 'product-image'); ?></div>
      <?php
            $pi_counter = 1;
            $pi_html = array();
    		$caroucelImages ='';
			$caroucelImages .= '<div class="productThumbsWrapper"><ul id="productThumbs">';
			$caroucelImages .= '<li class="thumb_1"><a href="#" data-image="'.DIR_WS_IMAGES . $product_info['products_image'].'" data-zoom-image="'.DIR_WS_IMAGES . $product_info['products_image'].'">'.tep_image(DIR_WS_IMAGES . $product_info['products_image'],addslashes($product_info['products_name']), PRODUCTTHUMB_IMAGE_WIDTH, PRODUCTTHUMB_IMAGE_HEIGHT).'</a></li>';
            while ($pi = tep_db_fetch_array($pi_query)) {
              $pi_counter++;
              if (tep_not_null($pi['htmlcontent'])) {
                $pi_html = $pi['htmlcontent'];
              }
			  else {
				$pi_html = '';	  
			  }
    		$caroucelImages .='<li class="thumb_'.$pi_counter.'">';
              $caroucelImages .= '<a href="#" data-image="'.DIR_WS_IMAGES . $pi['image'].'" data-zoom-image="'.DIR_WS_IMAGES . $pi['image'].'">'.tep_image(DIR_WS_IMAGES . $pi['image'], $pi_html, PRODUCTTHUMB_IMAGE_WIDTH, PRODUCTTHUMB_IMAGE_HEIGHT, 'id="piGalImg_' . $pi_counter . '"').'</a></li>';
            }
			$caroucelImages .='</ul></div>';
			echo $caroucelImages;
			if ($pi_counter > 3) 
				echo '<div id="allImages"><span class="closed">'.tep_draw_icon('fa-caret-down').'</span><span class="opened">'.tep_draw_icon('fa-caret-up').'</span></div>';
    ?>
    </div>
    <script type="text/javascript">
			$(".product-image").elevateZoom({
				gallery:'productThumbs',
				cursor: 'url(<?php echo DIR_WS_IMAGES.'/mouse.png'; ?>),auto',
				galleryActiveClass: 'active',
				imageCrossfade: true,
				loadingIcon: 'http://www.elevateweb.co.uk/spinner.gif'
			});
			$(".product-image").bind("click", function(e) { var ez = $('.product-image').data('elevateZoom');	$.fancybox(ez.getGalleryList()); return false; });
			function productThumbsHeight() {
				var loadHeight = $('#productThumbs > li').height();
				var showAllHeight = $('#productThumbs').height();
				$('.productThumbsWrapper').css({height: loadHeight});
				$('#allImages').addClass('closed');
				$('#allImages').click(function(){
					if ($(this).hasClass('closed')) {
						$('.productThumbsWrapper').animate({height: showAllHeight}, function(){$('#allImages').removeClass('closed').addClass('opened')});	
					}
					else {
						$('.productThumbsWrapper').animate({height: loadHeight}, function(){$('#allImages').removeClass('opened').addClass('closed')});
					}
				});
			}
			productThumbsHeight();
    	</script>
    <?php
          } else {
    ?>
    <div id="piGal" class="oneImage"> <a id="oneImage" href="<?php echo DIR_WS_IMAGES . $product_info['products_image']; ?>"><?php echo tep_image(DIR_WS_IMAGES . $product_info['products_image'], addslashes($product_info['products_name']), PRODUCTINFO_IMAGE_WIDTH, PRODUCTINFO_IMAGE_HEIGHT, '', 'product-image'); ?></a> 
      <script type="text/javascript">
	  		$(".product-image").elevateZoom({
				cursor: 'url(<?php echo DIR_WS_IMAGES.'/mouse.png'; ?>),auto',
				imageCrossfade: true,
				loadingIcon: 'http://www.elevateweb.co.uk/spinner.gif'
			});
        	$('#oneImage').fancybox();
        </script> 
    </div>
    <?php
          }
        }
    ?>
  </div>
  <div id="productInfo" class="col-xs-4">
    <h1 class="page-product-name"><?php echo $products_name; ?></h1>
    <?php
            if ($product_info['products_date_available'] > date('Y-m-d H:i:s')) {
        ?>
    <div class="alert alert-warning"><?php echo sprintf(TEXT_DATE_AVAILABLE, tep_date_long($product_info['products_date_available'])); ?></div>
    <?php
            }
        ?>
    <?php echo stripslashes($product_info['products_description']); ?> </div>
  <div id="productActions" class="col-xs-4">
    <div class="product-action-inner">
      <div class="page-product-price price"><?php echo $products_price; ?></div>
      <?php
            $products_attributes_query = tep_db_query("select count(*) as total from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_ATTRIBUTES . " patrib where patrib.products_id='" . (int)$HTTP_GET_VARS['products_id'] . "' and patrib.options_id = popt.products_options_id and popt.language_id = '" . (int)$languages_id . "'");
            $products_attributes = tep_db_fetch_array($products_attributes_query);
            if ($products_attributes['total'] > 0) {
        ?>
      <h4 class="subheading"><?php echo TEXT_PRODUCT_OPTIONS; ?></h4>
      <div class="productAtributes">
        <?php
                $products_options_name_query = tep_db_query("select distinct popt.products_options_id, popt.products_options_name from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_ATTRIBUTES . " patrib where patrib.products_id='" . (int)$HTTP_GET_VARS['products_id'] . "' and patrib.options_id = popt.products_options_id and popt.language_id = '" . (int)$languages_id . "' order by popt.products_options_name");
                while ($products_options_name = tep_db_fetch_array($products_options_name_query)) {
                $products_options_array = array();
                $products_options_query = tep_db_query("select pov.products_options_values_id, pov.products_options_values_name, pa.options_values_price, pa.price_prefix from " . TABLE_PRODUCTS_ATTRIBUTES . " pa, " . TABLE_PRODUCTS_OPTIONS_VALUES . " pov where pa.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pa.options_id = '" . (int)$products_options_name['products_options_id'] . "' and pa.options_values_id = pov.products_options_values_id and pov.language_id = '" . (int)$languages_id . "'");
                while ($products_options = tep_db_fetch_array($products_options_query)) {
                    $products_options_array[] = array('id' => $products_options['products_options_values_id'], 'text' => $products_options['products_options_values_name']);
                if ($products_options['options_values_price'] != '0') {
                    $products_options_array[sizeof($products_options_array)-1]['text'] .= ' (' . $products_options['price_prefix'] . $currencies->display_price($products_options['options_values_price'], tep_get_tax_rate($product_info['products_tax_class_id'])) .') ';
                    }
                }
    
            if (is_string($HTTP_GET_VARS['products_id']) && isset($cart->contents[$HTTP_GET_VARS['products_id']]['attributes'][$products_options_name['products_options_id']])) {
              $selected_attribute = $cart->contents[$HTTP_GET_VARS['products_id']]['attributes'][$products_options_name['products_options_id']];
            } else {
              $selected_attribute = false;
            }
    ?>
        <div class="form-group">
          <label><?php echo $products_options_name['products_options_name'] . ':'; ?></label>
          <?php echo tep_draw_pull_down_menu('id[' . $products_options_name['products_options_id'] . ']', $products_options_array, $selected_attribute); ?></div>
        <?php
          }
    ?>
      </div>
      <?php
        }
    ?>
      <?php
            $reviews_query = tep_db_query("select count(*) as count from " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd where r.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and r.reviews_id = rd.reviews_id and rd.languages_id = '" . (int)$languages_id . "' and reviews_status = 1");
            $reviews = tep_db_fetch_array($reviews_query);
    ?>
      	<div class="buttonSet">
            <span class="buttonAction">
                <?php echo tep_draw_hidden_field('products_id', $product_info['products_id']) . tep_draw_button(IMAGE_BUTTON_IN_CART, 'cart btn btn-primary', null, 'primary'); ?>
            </span>
                <?php if ($reviews['count'] > 0) {
					echo tep_draw_button(IMAGE_BUTTON_REVIEWS . (($reviews['count'] > 0) ? ' (' . $reviews['count'] . ')' : ''), 'getReviews btn btn-default', tep_href_link(FILENAME_PRODUCT_REVIEWS, tep_get_all_get_params()));
					echo '
					<script type="text/javascript">
						$(document).ready(function() {
							var position = $("#productReviews").position();
							$(".getReviews").on("click", function(){
								$("html,body").animate({
									scrollTop: $("#productReviews").offset().top + 30
								})
								return false;
							})
						});
					</script>
					';
				} else {
					echo tep_draw_button(IMAGE_BUTTON_WRITE_REVIEW , 'comment btn btn-default', tep_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, tep_get_all_get_params()));	
				}
				?> 
        </div>
    </div>
    <div class="product-socials">
      <?php 
		$sbm_array = explode(';', MODULE_SOCIAL_BOOKMARKS_INSTALLED);
		$social_bookmarks = array();
		
        foreach ( $sbm_array as $sbm ) {
          $class = substr($sbm, 0, strrpos($sbm, '.'));

          if ( !class_exists($class) ) {
            include(DIR_WS_LANGUAGES . $language . '/modules/social_bookmarks/' . $sbm);
            include(DIR_WS_MODULES . 'social_bookmarks/' . $class . '.php');
          }

          $sb = new $class();

          if ( $sb->isEnabled() ) {
            $social_bookmarks[] = $sb->getOutput();
          }
        }

        if ( !empty($social_bookmarks) ) {
          $data = '<div class="socials-box">' . implode(' ', $social_bookmarks) . '</div>';
			
		  echo $data;
		}
		?>
    </div>
  </div>
</div>
</form>
<?php 
	$tags_query = tep_db_query("select p.tag_id, t.tag_text, count(*) from ". TABLE_PRODUCTS_TAGS ." p, ". TABLE_TAGS ." t where p.tag_id = t.tag_id AND p.products_id = ".(int)$HTTP_GET_VARS['products_id']." group by p.tag_id order by count(*) desc limit 15" );
	if(tep_db_num_rows($tags_query) > 1) {
	$data='';
	while ($tags = tep_db_fetch_array($tags_query)) {
		$data.= '<a href="' . tep_href_link(FILENAME_TAG_PRODUCTS) .'?id_tag='.$tags['tag_id'].'" class="weight_'.$tags['count(*)'].'">'.urldecode($tags['tag_text']).'</a>';
	}
?>
<div class="module tags-container">
  <h3 class="module-heading"><?php echo TAGS_PRODUCT;?></h3>
  <div class="block-content"> <?php echo $data;?> </div>
</div>
<?php } ?>
<?php  /* Product revews */
	$reviews_query_raw = "select r.reviews_id, left(rd.reviews_text, 100) as reviews_text, r.reviews_rating, r.date_added, r.customers_name from " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd where r.products_id = '" . (int)$product_info['products_id'] . "' and r.reviews_id = rd.reviews_id and rd.languages_id = '" . (int)$languages_id . "' and r.reviews_status = 1 order by r.reviews_id desc";
	$reviews_split = new splitPageResults($reviews_query_raw, 1000);
	$reviews_query = tep_db_query($reviews_split->sql_query);
	if ($reviews_split->number_of_rows > 0) {
		$reviewsContent = '';
		$reviewsContent .= '<div id="productReviews" class="module">';
		$reviewsContent .= '<h3 class="module-heading">'.IMAGE_BUTTON_REVIEWS.'</h3>';
		$reviewsContent .= '<ul>';
		while ($reviews = tep_db_fetch_array($reviews_query)) {
			$reviewsContent .=
				'<li class="reviewsList"><div class="well well-sm">'.
				'	<h4><a class="product-name" href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $product_info['products_id'] . '&reviews_id=' . $reviews['reviews_id']) . '">' . sprintf(TEXT_REVIEW_BY, tep_output_string_protected($reviews['customers_name'])) . '</a></h4>'.
				'	<p class="mesInfo"><span class="dateAdded">'.sprintf(TEXT_REVIEW_DATE_ADDED, tep_date_long($reviews['date_added'])).'</span></p>'.
				'	<div class="reviewRating">'. sprintf(TEXT_REVIEW_RATING, tep_draw_rating($reviews['reviews_rating']), sprintf(TEXT_OF_5_STARS, $reviews['reviews_rating'])) .'</div>'.
				'	<div class="reviewDescription">'.tep_break_string(tep_output_string_protected($reviews['reviews_text']), 60, '-<br />') . ((strlen($reviews['reviews_text']) >= 100) ? '..' : '').'</div>'.
				'</div></li>';
		}
		$reviewsContent .= '</ul>';
		$reviewsContent .= tep_draw_button(IMAGE_BUTTON_WRITE_REVIEW , 'new-review btn btn-default', tep_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, tep_get_all_get_params()));
		$reviewsContent .= '</div>';
		echo $reviewsContent;
	}
	
?>
<?php
	if ((USE_CACHE == 'true') && empty($SID)) {
		echo tep_cache_also_purchased(3600);
	} else {
		include(DIR_WS_MODULES . FILENAME_ALSO_PURCHASED_PRODUCTS);
	}
	
	include(DIR_WS_MODULES . FILENAME_RELATED_PRODUCTS);
	
?>
<?php
  }

  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
