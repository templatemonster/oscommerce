<?php
  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_REVIEWS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_REVIEWS));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content reviewsPage">
  <?php
  $reviews_query_raw = "select r.reviews_id, left(rd.reviews_text, 100) as reviews_text, r.reviews_rating, r.date_added, p.products_id, pd.products_name, p.products_image, r.customers_name from " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd, " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = r.products_id and r.reviews_id = rd.reviews_id and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' and rd.languages_id = '" . (int)$languages_id . "' and reviews_status = 1 order by r.reviews_id DESC";
  $reviews_split = new splitPageResults($reviews_query_raw, MAX_DISPLAY_NEW_REVIEWS);

  if ($reviews_split->number_of_rows > 0) {
    if ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3')) {
?>
  <div class="listing-panel top-panel">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></div>
      <div class="col-xs-6"><?php echo $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info'))) .'<span class="resultText">'. TEXT_RESULT_PAGE . '</span>'; ?></div>
    </div>
  </div>
  <?php
    }
    $reviews_query = tep_db_query($reviews_split->sql_query);
	$reviewContent = '';
	$reviewContent .= '<ul>';
    while ($reviews = tep_db_fetch_array($reviews_query)) {
	$reviewContent .= 
		'<li>'.
		'	<div class="reviewContainer row">'.
		'		<div class="reviewImage col-xs-4">'.
		'			<a class="product-image" href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $reviews['products_id'] . '&reviews_id=' . $reviews['reviews_id']) . '">' . tep_image(DIR_WS_IMAGES . $reviews['products_image'], $reviews['products_name'], HOMEPAGE_IMAGE_WIDTH, HOMEPAGE_IMAGE_HEIGHT,'', '') . '</a>'.
		'		</div>'.
		'		<div class="reviewContent col-xs-8">'.
		'			<div class="reviewInfo">'.
		'				<h4 class="product-name-box"><a class="product-name" href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $reviews['products_id'] . '&reviews_id=' . $reviews['reviews_id']) . '">' . $reviews['products_name'] . '</a></h4>'.
		'				<p class="mesInfo">'.
		'					<span class="authorName">'.sprintf(TEXT_REVIEW_BY, tep_output_string_protected($reviews['customers_name'])).'</span>'.
		'					<span class="dateAdded">'.sprintf(TEXT_REVIEW_DATE_ADDED, tep_date_long($reviews['date_added'])).'</span>'.
		'				</p>'.
		'				<div class="reviewRating">'.sprintf(TEXT_REVIEW_RATING, tep_draw_rating($reviews['reviews_rating']), sprintf(TEXT_OF_5_STARS, $reviews['reviews_rating'])).'</div>'.
		'			</div>'.
		'			<div class="reviewDescription">'.tep_break_string(tep_output_string_protected($reviews['reviews_text']), 60, '-<br />') . ((strlen($reviews['reviews_text']) >= 100) ? '..' : '').'</div>'.
		'		</div>'.
		'	</div>'.
    	'</li>';
    }
	$reviewContent .= '</ul>';
	echo $reviewContent;
  } else {
?>
  <div class="alert alert-info"> <?php echo TEXT_NO_REVIEWS; ?> </div>
  <?php
  }

  if (($reviews_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>
  <div class="listing-panel bottom-panel">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></div>
      <div class="col-xs-6"><?php echo $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info'))).'<span class="resultText">' .TEXT_RESULT_PAGE . '</span>'; ?></div>
    </div>
  </div>
  <?php
  }
?>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
