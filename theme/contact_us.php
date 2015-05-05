<?php
  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CONTACT_US);

  if (isset($HTTP_GET_VARS['action']) && ($HTTP_GET_VARS['action'] == 'send') && isset($HTTP_POST_VARS['formid']) && ($HTTP_POST_VARS['formid'] == $sessiontoken)) {
    $error = false;

    $name = tep_db_prepare_input($HTTP_POST_VARS['name']);
    $email_address = tep_db_prepare_input($HTTP_POST_VARS['email']);
    $enquiry = tep_db_prepare_input($HTTP_POST_VARS['enquiry']);

    if (!tep_validate_email($email_address)) {
      $error = true;

      $messageStack->add('contact', ENTRY_EMAIL_ADDRESS_CHECK_ERROR);
    }

    $actionRecorder = new actionRecorder('ar_contact_us', (tep_session_is_registered('customer_id') ? $customer_id : null), $name);
    if (!$actionRecorder->canPerform()) {
      $error = true;

      $actionRecorder->record(false);

      $messageStack->add('contact', sprintf(ERROR_ACTION_RECORDER, (defined('MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES') ? (int)MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES : 15)));
    }

    if ($error == false) {
      tep_mail(STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS, EMAIL_SUBJECT, $enquiry, $name, $email_address);

      $actionRecorder->record();

      tep_redirect(tep_href_link(FILENAME_CONTACT_US, 'action=success'));
    }
  }

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_CONTACT_US));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<?php
  if ($messageStack->size('contact') > 0) {
    echo $messageStack->output('contact');
  }

  if (isset($HTTP_GET_VARS['action']) && ($HTTP_GET_VARS['action'] == 'success')) {
?>
<div class="alert alert-success"> <?php echo TEXT_SUCCESS; ?> </div>
<div class="button-container clearfix"> <?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'btn btn-default', tep_href_link(FILENAME_DEFAULT)); ?> </div>
<?php
  } else {
?>
<?php echo tep_draw_form('contact_us', tep_href_link(FILENAME_CONTACT_US, 'action=send'), 'post', '', true); ?>
<div class="block-content">
  <div class="row form-group">
    <div class="col-xs-3"><?php echo ENTRY_NAME; ?></div>
    <div class="col-xs-9"><?php echo tep_draw_input_field('name'); ?></div>
  </div>
  <div class="row form-group">
    <div class="col-xs-3"><?php echo ENTRY_EMAIL; ?></div>
    <div class="col-xs-9"><?php echo tep_draw_input_field('email'); ?></div>
  </div>
  <div class="row form-group">
    <div class="col-xs-3"><?php echo ENTRY_ENQUIRY; ?></div>
    <div class="col-xs-9"><?php echo tep_draw_textarea_field('enquiry', 'soft', 50, 15); ?></div>
  </div>
  <div class="buttonSet text-right button-container"> <?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'btn btn-default', null, 'primary'); ?> </div>
</div>
</form>
<?php
  }

  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
