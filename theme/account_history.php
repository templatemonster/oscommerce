<?php
  require('includes/application_top.php');

  if (!tep_session_is_registered('customer_id')) {
    $navigation->set_snapshot();
    tep_redirect(tep_href_link(FILENAME_LOGIN, '', 'SSL'));
  }

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_ACCOUNT_HISTORY);

  $breadcrumb->add(NAVBAR_TITLE_1, tep_href_link(FILENAME_ACCOUNT, '', 'SSL'));
  $breadcrumb->add(NAVBAR_TITLE_2, tep_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL'));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content account">
  <?php
  $orders_total = tep_count_customer_orders();

  if ($orders_total > 0) {
    $history_query_raw = "select o.orders_id, o.date_purchased, o.delivery_name, o.billing_name, ot.text as order_total, s.orders_status_name from " . TABLE_ORDERS . " o, " . TABLE_ORDERS_TOTAL . " ot, " . TABLE_ORDERS_STATUS . " s where o.customers_id = '" . (int)$customer_id . "' and o.orders_id = ot.orders_id and ot.class = 'ot_total' and o.orders_status = s.orders_status_id and s.language_id = '" . (int)$languages_id . "' and s.public_flag = '1' order by orders_id DESC";
    $history_split = new splitPageResults($history_query_raw, MAX_DISPLAY_ORDER_HISTORY);
    $history_query = tep_db_query($history_split->sql_query);

    while ($history = tep_db_fetch_array($history_query)) {
      $products_query = tep_db_query("select count(*) as count from " . TABLE_ORDERS_PRODUCTS . " where orders_id = '" . (int)$history['orders_id'] . "'");
      $products = tep_db_fetch_array($products_query);

      if (tep_not_null($history['delivery_name'])) {
        $order_type = TEXT_ORDER_SHIPPED_TO;
        $order_name = $history['delivery_name'];
      } else {
        $order_type = TEXT_ORDER_BILLED_TO;
        $order_name = $history['billing_name'];
      }
?>
  <div class="box">
    <h2 class="page-subheading"><?php echo TEXT_ORDER_NUMBER . ' ' . $history['orders_id'] . ' <span class="contentText">(' . $history['orders_status_name'] . ')</span>'; ?></h2>
    <div class="row">
      <div class="col-xs-4"> <?php echo '<p><strong>' . TEXT_ORDER_DATE . '</strong> ' . tep_date_long($history['date_purchased']) . '</p><p><strong>' . $order_type . '</strong> ' . tep_output_string_protected($order_name).'</p>'; ?> </div>
      <div class="col-xs-4"> <?php echo '<p><strong>' . TEXT_ORDER_PRODUCTS . '</strong> ' . $products['count'] . '</p><p><strong>' . TEXT_ORDER_COST . '</strong> ' . strip_tags($history['order_total']).'</p>'; ?> </div>
      <div class="col-xs-4 text-right"> <?php echo tep_draw_button(SMALL_IMAGE_BUTTON_VIEW, 'document btn btn-default', tep_href_link(FILENAME_ACCOUNT_HISTORY_INFO, (isset($HTTP_GET_VARS['page']) ? 'page=' . $HTTP_GET_VARS['page'] . '&' : '') . 'order_id=' . $history['orders_id'], 'SSL'), 'primary'); ?> </div>
    </div>
  </div>
  <?php
    }
?>
  <div class="listing-panel bottom-panel">
    <div class="row">
      <div class="col-xs-6 displayText"><?php echo $history_split->display_count(TEXT_DISPLAY_NUMBER_OF_ORDERS); ?></div>
      <div class="col-xs-6"><?php echo $history_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))). '<span class="resultText">'.TEXT_RESULT_PAGE . '</span>'; ?></div>
    </div>
  </div>
  <?php
  } else {
?>
  <div class="alert alert-info"> <?php echo TEXT_NO_PURCHASES; ?> </div>
  <?php
  }
?>
  <div class="buttonSet button-container"> <?php echo tep_draw_button(IMAGE_BUTTON_BACK, 'btn btn-default', tep_href_link(FILENAME_ACCOUNT, '', 'SSL')); ?> </div>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
