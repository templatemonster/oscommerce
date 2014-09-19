<?php
  require('includes/application_top.php');

  if (!tep_session_is_registered('customer_id')) {
    $navigation->set_snapshot();
    tep_redirect(tep_href_link(FILENAME_LOGIN, '', 'SSL'));
  }

  if (!isset($HTTP_GET_VARS['order_id']) || (isset($HTTP_GET_VARS['order_id']) && !is_numeric($HTTP_GET_VARS['order_id']))) {
    tep_redirect(tep_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL'));
  }
  
  $customer_info_query = tep_db_query("select o.customers_id from " . TABLE_ORDERS . " o, " . TABLE_ORDERS_STATUS . " s where o.orders_id = '". (int)$HTTP_GET_VARS['order_id'] . "' and o.orders_status = s.orders_status_id and s.language_id = '" . (int)$languages_id . "' and s.public_flag = '1'");
  $customer_info = tep_db_fetch_array($customer_info_query);
  if ($customer_info['customers_id'] != $customer_id) {
    tep_redirect(tep_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL'));
  }

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_ACCOUNT_HISTORY_INFO);
  $current_page = FILENAME_ACCOUNT_HISTORY_INFO;

  $breadcrumb->add(NAVBAR_TITLE_1, tep_href_link(FILENAME_ACCOUNT, '', 'SSL'));
  $breadcrumb->add(NAVBAR_TITLE_2, tep_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL'));
  $breadcrumb->add(sprintf(NAVBAR_TITLE_3, $HTTP_GET_VARS['order_id']), tep_href_link(FILENAME_ACCOUNT_HISTORY_INFO, 'order_id=' . $HTTP_GET_VARS['order_id'], 'SSL'));

  require(DIR_WS_CLASSES . 'order.php');
  $order = new order($HTTP_GET_VARS['order_id']);

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content order-history">
  <div class="box">
    <h2 class="page-subheading clearfix"><?php echo sprintf(HEADING_ORDER_NUMBER, $HTTP_GET_VARS['order_id']) . ' <span class="contentText">(' . $order->info['orders_status'] . ')</span>'; ?><small class="pull-right"><?php echo HEADING_ORDER_TOTAL . ' ' . $order->info['total']; ?><br />
      <?php echo HEADING_ORDER_DATE . ' ' . tep_date_long($order->info['date_purchased']); ?></small></h2>
    <div class="row">
      <?php
  if ($order->delivery != false) {
?>
      <div class="col-xs-4">
        <p> <strong><?php echo HEADING_DELIVERY_ADDRESS; ?></strong> </p>
        <p> <?php echo tep_address_format($order->delivery['format_id'], $order->delivery, 1, ' ', '<br />'); ?> </p>
        <?php
    if (tep_not_null($order->info['shipping_method'])) {
?>
        <p> <strong><?php echo HEADING_SHIPPING_METHOD; ?></strong> </p>
        <p> <?php echo $order->info['shipping_method']; ?> </p>
        <?php
                }
            ?>
      </div>
      <?php
		}
	?>
      <div class="col-xs-<?php echo (($order->delivery != false) ? '8' : '12'); ?>">
        <table class="table table-custom">
          <?php
      if (sizeof($order->info['tax_groups']) > 1) {
    ?>
          <tr>
            <td colspan="2"><strong><?php echo HEADING_PRODUCTS; ?></strong></td>
            <td class="text-right"><strong><?php echo HEADING_TAX; ?></strong></td>
            <td class="text-right"><strong><?php echo HEADING_TOTAL; ?></strong></td>
          </tr>
          <?php
      } else {
    ?>
          <tr>
            <td colspan="2"><strong><?php echo HEADING_PRODUCTS; ?></strong></td>
            <td class="text-right"><strong><?php echo HEADING_TOTAL; ?></strong></td>
          </tr>
          <?php
      }
    
      for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
        echo '          <tr>' . "\n" .
             '            <td class="align-top">' . $order->products[$i]['qty'] . '&nbsp;x&nbsp;</td>' . "\n" .
             '            <td>' . $order->products[$i]['name'];
    
        if ( (isset($order->products[$i]['attributes'])) && (sizeof($order->products[$i]['attributes']) > 0) ) {
          for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
            echo '<br /><small>&nbsp;<i> - ' . $order->products[$i]['attributes'][$j]['option'] . ': ' . $order->products[$i]['attributes'][$j]['value'] . '</i></small>';
          }
        }
    
        echo '</td>' . "\n";
    
        if (sizeof($order->info['tax_groups']) > 1) {
          echo '            <td>' . tep_display_tax_value($order->products[$i]['tax']) . '%</td>' . "\n";
        }
    
        echo '            <td class="text-right price">' . $currencies->format(tep_add_tax($order->products[$i]['final_price'], $order->products[$i]['tax']) * $order->products[$i]['qty'], true, $order->info['currency'], $order->info['currency_value']) . '</td>' . "\n" .
             '          </tr>' . "\n";
      }
    ?>
        </table>
      </div>
    </div>
  </div>
  <div class="box">
    <h2 class="page-subheading"><?php echo HEADING_BILLING_INFORMATION; ?></h2>
    <div class="row">
      <div class="col-xs-4">
        <table class="table table-custom">
          <tr>
            <td><strong><?php echo HEADING_BILLING_ADDRESS; ?></strong></td>
          </tr>
          <tr>
            <td><?php echo tep_address_format($order->billing['format_id'], $order->billing, 1, ' ', '<br />'); ?></td>
          </tr>
          <tr>
            <td><strong><?php echo HEADING_PAYMENT_METHOD; ?></strong></td>
          </tr>
          <tr>
            <td><?php echo $order->info['payment_method']; ?></td>
          </tr>
        </table>
      </div>
      <div class="col-xs-8 text-right">
        <div class="row">
          <?php
  for ($i=0, $n=sizeof($order->totals); $i<$n; $i++) {
    echo '<div class="col-xs-10">'.$order->totals[$i]['title'] .'</div><div class="col-xs-2">'. $order->totals[$i]['text'].'</div>';
  }
?>
        </div>
      </div>
    </div>
  </div>
  <h2 class="page-subheading"><?php echo HEADING_ORDER_HISTORY; ?></h2>
  <table class="table table-striped">
    <?php
  $statuses_query = tep_db_query("select os.orders_status_name, osh.date_added, osh.comments from " . TABLE_ORDERS_STATUS . " os, " . TABLE_ORDERS_STATUS_HISTORY . " osh where osh.orders_id = '" . (int)$HTTP_GET_VARS['order_id'] . "' and osh.orders_status_id = os.orders_status_id and os.language_id = '" . (int)$languages_id . "' and os.public_flag = '1' order by osh.date_added");
  while ($statuses = tep_db_fetch_array($statuses_query)) {
    echo '          <tr>' . "\n" .
         '            <td class="align-top table-date">' . tep_date_short($statuses['date_added']) . '</td>' . "\n" .
         '            <td  class="align-top">' . $statuses['orders_status_name'] . '</td>' . "\n" .
         '            <td  class="align-top">' . (empty($statuses['comments']) ? '&nbsp;' : nl2br(tep_output_string_protected($statuses['comments']))) . '</td>' . "\n" .
         '          </tr>' . "\n";
  }
?>
  </table>
  <?php
  if (DOWNLOAD_ENABLED == 'true') include(DIR_WS_MODULES . 'downloads.php');
?>
  <div class="buttonSet button-container"> <?php echo tep_draw_button(IMAGE_BUTTON_BACK, 'btn btn-default', tep_href_link(FILENAME_ACCOUNT_HISTORY, tep_get_all_get_params(array('order_id')), 'SSL')); ?> </div>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
