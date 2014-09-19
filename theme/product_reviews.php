<?php
  require('includes/application_top.php');

  if (!isset($HTTP_GET_VARS['products_id'])) {
    tep_redirect(tep_href_link(FILENAME_REVIEWS));
  }

  $product_info_query = tep_db_query("select p.products_id, p.products_model, p.products_image, p.products_price, p.products_tax_class_id, pd.products_name from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and p.products_status = '1' and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "'");
  if (!tep_db_num_rows($product_info_query)) {
    tep_redirect(tep_href_link(FILENAME_REVIEWS));
  } else {
    $product_info = tep_db_fetch_array($product_info_query);
  }

  if ($new_price = tep_get_products_special_price($product_info['products_id'])) {
    $products_price = '<span class="productSpecialPrice price new-price">' . $currencies->display_price($new_price, tep_get_tax_rate($product_info['products_tax_class_id'])) . '</span><del>' . $currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id'])) . '</del>';
  } else {
    $products_price = $currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id']));
  }

  if (tep_not_null($product_info['products_model'])) {
    $products_name = $product_info['products_name'] . '<span class="productModel">[' . $product_info['products_model'] . ']</span>';
  } else {
    $products_name = $product_info['products_name'];
  }

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PRODUCT_REVIEWS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_PRODUCT_REVIEWS, tep_get_all_get_params()));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>
<?php
  if ($messageStack->size('product_reviews') > 0) {
    echo $messageStack->output('product_reviews');
  }
?>

<div class="reviewTopRow">
  <div class="row">
    <div class="col-xs-6">
      <h1 class="page-product-name"><?php echo $products_name; ?></h1>
    </div>
    <div class="page-product-price price col-xs-6 text-right"><?php echo $products_price; ?></div>
  </div>
</div>
<div class="block-content">
  <div class="reviewContent row">
    <?php
  if (tep_not_null($product_info['products_image'])) {
?>
    <div class="reviewImageBlock col-xs-4"> <?php echo '<div class="reviewImage"><a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $product_info['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $product_info['products_image'], addslashes($product_info['products_name']), HOMEPAGE_IMAGE_WIDTH, HOMEPAGE_IMAGE_HEIGHT, '', '') . '</a></div>'; ?>
      <div class="button-container"><?php echo tep_draw_button(IMAGE_BUTTON_IN_CART, 'cart btn btn-primary', tep_href_link(basename($PHP_SELF), tep_get_all_get_params(array('action')) . 'action=buy_now')); ?></div>
    </div>
    <div class="reviews-list block-content col-xs-8">
      <?php
  }

  $reviews_query_raw = "select r.reviews_id, left(rd.reviews_text, 100) as reviews_text, r.reviews_rating, r.date_added, r.customers_name from " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd where r.products_id = '" . (int)$product_info['products_id'] . "' and r.reviews_id = rd.reviews_id and rd.languages_id = '" . (int)$languages_id . "' and r.reviews_status = 1 order by r.reviews_id desc";
  $reviews_split = new splitPageResults($reviews_query_raw, MAX_DISPLAY_NEW_REVIEWS);

  if ($reviews_split->number_of_rows > 0) {
    if ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3')) {
?>
      <div class="listing-panel top-panel">
        <div class="row">
          <div class="col-xs-6 displayText"><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></div>
          <div class="col-xs-6"><?php echo $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info'))). '<span class="resultText">'.TEXT_RESULT_PAGE.'</span>'; ?></div>
        </div>
      </div>
      <?php
    }

    $reviews_query = tep_db_query($reviews_split->sql_query);
	$reviewsContent = '';
	$reviewsContent .= '<ul>';
    while ($reviews = tep_db_fetch_array($reviews_query)) {
		$reviewsContent .=
			'<li class="reviewsList">'.
			'	<h4><a class="product-name" href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $product_info['products_id'] . '&reviews_id=' . $reviews['reviews_id']) . '">' . sprintf(TEXT_REVIEW_BY, tep_output_string_protected($reviews['customers_name'])) . '</a></h4>'.
			'	<p class="mesInfo"><span class="dateAdded">'.sprintf(TEXT_REVIEW_DATE_ADDED, tep_date_long($reviews['date_added'])).'</span></p>'.
			'	<div class="reviewRating">'. sprintf(TEXT_REVIEW_RATING, tep_draw_rating($reviews['reviews_rating']), sprintf(TEXT_OF_5_STARS, $reviews['reviews_rating'])) .'</div>'.
			'	<div class="reviewDescription">'.tep_break_string(tep_output_string_protected($reviews['reviews_text']), 60, '-<br />') . ((strlen($reviews['reviews_text']) >= 100) ? '..' : '').'</div>'.
			'</li>';
    }
	$reviewsContent .= '</ul>';
	echo $reviewsContent;
  } else {
?>
      <div class="alert alert-warning"> <?php echo TEXT_NO_REVIEWS; ?> </div>
      <?php
  }

  if (($reviews_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
      <div class="listing-panel bottom-panel">
        <div class="row">
          <div class="col-xs-6 displayText"><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></div>
          <div class="col-xs-6"><?php echo $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info'))). '<span class="resultText">'.TEXT_RESULT_PAGE.'</span>'; ?></div>
        </div>
      </div>
      <?php
  }
?>
    </div>
    <div class="buttonSet col-xs-8 col-xs-offset-4"> <span class="buttonAction"><?php echo tep_draw_button(IMAGE_BUTTON_WRITE_REVIEW, 'comment btn btn-default', tep_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, tep_get_all_get_params()), 'primary'); ?></span> <?php echo tep_draw_button(IMAGE_BUTTON_BACK, 'triangle-1-w btn btn-default', tep_href_link(FILENAME_PRODUCT_INFO, tep_get_all_get_params())); ?> </div>
  </div>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
