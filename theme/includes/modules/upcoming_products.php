<?php
  $expected_query = tep_db_query("select p.products_id, pd.products_name, p.products_image, m.manufacturers_name, m.manufacturers_id, products_date_available as date_expected from " . TABLE_PRODUCTS . " p left join " . TABLE_MANUFACTURERS . " m on (p.manufacturers_id = m.manufacturers_id), " . TABLE_PRODUCTS_DESCRIPTION . " pd where to_days(products_date_available) >= to_days(now()) and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' order by " . EXPECTED_PRODUCTS_FIELD . " " . EXPECTED_PRODUCTS_SORT . " limit " . MAX_DISPLAY_UPCOMING_PRODUCTS);
  if (tep_db_num_rows($expected_query) > 0) {
?>

  <div class="module">
    <h3 class="module-heading"><span><?php echo TABLE_HEADING_UPCOMING_PRODUCTS; ?></span></h3>

    <ul class="upcommingList row">
<?php
    while ($expected = tep_db_fetch_array($expected_query)) {
      echo '        <li class="col-xs-2">' .
	  	   '			<div class="inner-wrapper">'.
		   '        		<div class="date-avalible">' . tep_date_short($expected['date_expected']) . '</div>' .
	  	   '				<div class="image-block">'.
		   '					<a class="boxproduct-img" href="'. tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $expected['products_id']) . '">'.tep_image(DIR_WS_IMAGES . $expected['products_image'], $expected['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT,'').'</a>'.
		   '				</div>'.
           '        		<div class="product-name-box"><a class="product-name name" href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $expected['manufacturers_id']) . '">' . $expected['products_name'] . '</a></div>' .
		   '        		<div class="product-manufacturer-box"><a class="manufacturer-name" href="' . tep_href_link(FILENAME_DEFAULT, 'manufacturers_id=' . $expected['products_name']) . '">' . $expected['manufacturers_name'] . '</a></div>' .
		   '        	</div>';
           '        </li>';
    }
?>
    </ul>
  </div>

<?php
  }
?>
