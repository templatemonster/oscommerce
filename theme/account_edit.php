<?php
  require('includes/application_top.php');

  if (!tep_session_is_registered('customer_id')) {
    $navigation->set_snapshot();
    tep_redirect(tep_href_link(FILENAME_LOGIN, '', 'SSL'));
  }

// needs to be included earlier to set the success message in the messageStack
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_ACCOUNT_EDIT);

  if (isset($HTTP_POST_VARS['action']) && ($HTTP_POST_VARS['action'] == 'process') && isset($HTTP_POST_VARS['formid']) && ($HTTP_POST_VARS['formid'] == $sessiontoken)) {
    if (ACCOUNT_GENDER == 'true') $gender = tep_db_prepare_input($HTTP_POST_VARS['gender']);
    $firstname = tep_db_prepare_input($HTTP_POST_VARS['firstname']);
    $lastname = tep_db_prepare_input($HTTP_POST_VARS['lastname']);
    if (ACCOUNT_DOB == 'true') $dob = tep_db_prepare_input($HTTP_POST_VARS['dob']);
    $email_address = tep_db_prepare_input($HTTP_POST_VARS['email_address']);
    $telephone = tep_db_prepare_input($HTTP_POST_VARS['telephone']);
    $fax = tep_db_prepare_input($HTTP_POST_VARS['fax']);

    $error = false;

    if (ACCOUNT_GENDER == 'true') {
      if ( ($gender != 'm') && ($gender != 'f') ) {
        $error = true;

        $messageStack->add('account_edit', ENTRY_GENDER_ERROR);
      }
    }

    if (strlen($firstname) < ENTRY_FIRST_NAME_MIN_LENGTH) {
      $error = true;

      $messageStack->add('account_edit', ENTRY_FIRST_NAME_ERROR);
    }

    if (strlen($lastname) < ENTRY_LAST_NAME_MIN_LENGTH) {
      $error = true;

      $messageStack->add('account_edit', ENTRY_LAST_NAME_ERROR);
    }

    if (ACCOUNT_DOB == 'true') {
      if ((strlen($dob) < ENTRY_DOB_MIN_LENGTH) || (!empty($dob) && (!is_numeric(tep_date_raw($dob)) || !@checkdate(substr(tep_date_raw($dob), 4, 2), substr(tep_date_raw($dob), 6, 2), substr(tep_date_raw($dob), 0, 4))))) {
        $error = true;

        $messageStack->add('account_edit', ENTRY_DATE_OF_BIRTH_ERROR);
      }
    }

    if (strlen($email_address) < ENTRY_EMAIL_ADDRESS_MIN_LENGTH) {
      $error = true;

      $messageStack->add('account_edit', ENTRY_EMAIL_ADDRESS_ERROR);
    }

    if (!tep_validate_email($email_address)) {
      $error = true;

      $messageStack->add('account_edit', ENTRY_EMAIL_ADDRESS_CHECK_ERROR);
    }

    $check_email_query = tep_db_query("select count(*) as total from " . TABLE_CUSTOMERS . " where customers_email_address = '" . tep_db_input($email_address) . "' and customers_id != '" . (int)$customer_id . "'");
    $check_email = tep_db_fetch_array($check_email_query);
    if ($check_email['total'] > 0) {
      $error = true;

      $messageStack->add('account_edit', ENTRY_EMAIL_ADDRESS_ERROR_EXISTS);
    }

    if (strlen($telephone) < ENTRY_TELEPHONE_MIN_LENGTH) {
      $error = true;

      $messageStack->add('account_edit', ENTRY_TELEPHONE_NUMBER_ERROR);
    }

    if ($error == false) {
      $sql_data_array = array('customers_firstname' => $firstname,
                              'customers_lastname' => $lastname,
                              'customers_email_address' => $email_address,
                              'customers_telephone' => $telephone,
                              'customers_fax' => $fax);

      if (ACCOUNT_GENDER == 'true') $sql_data_array['customers_gender'] = $gender;
      if (ACCOUNT_DOB == 'true') $sql_data_array['customers_dob'] = tep_date_raw($dob);

      tep_db_perform(TABLE_CUSTOMERS, $sql_data_array, 'update', "customers_id = '" . (int)$customer_id . "'");

      tep_db_query("update " . TABLE_CUSTOMERS_INFO . " set customers_info_date_account_last_modified = now() where customers_info_id = '" . (int)$customer_id . "'");

      $sql_data_array = array('entry_firstname' => $firstname,
                              'entry_lastname' => $lastname);

      tep_db_perform(TABLE_ADDRESS_BOOK, $sql_data_array, 'update', "customers_id = '" . (int)$customer_id . "' and address_book_id = '" . (int)$customer_default_address_id . "'");

// reset the session variables
      $customer_first_name = $firstname;

      $messageStack->add_session('account', SUCCESS_ACCOUNT_UPDATED, 'success');

      tep_redirect(tep_href_link(FILENAME_ACCOUNT, '', 'SSL'));
    }
  }

  $account_query = tep_db_query("select customers_gender, customers_firstname, customers_lastname, customers_dob, customers_email_address, customers_telephone, customers_fax from " . TABLE_CUSTOMERS . " where customers_id = '" . (int)$customer_id . "'");
  $account = tep_db_fetch_array($account_query);

  $breadcrumb->add(NAVBAR_TITLE_1, tep_href_link(FILENAME_ACCOUNT, '', 'SSL'));
  $breadcrumb->add(NAVBAR_TITLE_2, tep_href_link(FILENAME_ACCOUNT_EDIT, '', 'SSL'));

  require(DIR_WS_INCLUDES . 'template_top.php');
  require('includes/form_check.js.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<?php
  if ($messageStack->size('account_edit') > 0) {
    echo $messageStack->output('account_edit');
  }
?>
<?php echo tep_draw_form('account_edit', tep_href_link(FILENAME_ACCOUNT_EDIT, '', 'SSL'), 'post', 'onsubmit="return check_form(account_edit);"', true) . tep_draw_hidden_field('action', 'process'); ?>
<div class="block-content account account-edit">
  <div class="box">
    <p class="require text-right"><?php echo FORM_REQUIRED_INFORMATION; ?></p>
    <h2 class="page-subheading"><?php echo MY_ACCOUNT_TITLE; ?></h2>
    <div class="content-box">
      <?php
              if (ACCOUNT_GENDER == 'true') {
                if (isset($gender)) {
                  $male = ($gender == 'm') ? true : false;
                } else {
                  $male = ($account['customers_gender'] == 'm') ? true : false;
                }
                $female = !$male;
            ?>
      <div class="form-group">
        <label><?php echo (tep_not_null(ENTRY_GENDER_TEXT) ? '<sup class="inputRequirement">' . ENTRY_GENDER_TEXT . '</sup>': '') . ENTRY_GENDER; ?></label>
        <?php echo tep_draw_radio_field('gender', 'm', $male) . '&nbsp;&nbsp;' . MALE . '&nbsp;&nbsp;' . tep_draw_radio_field('gender', 'f', $female) . '&nbsp;&nbsp;' . FEMALE; ?> </div>
      <?php
              }
            ?>
      <div class="form-group">
        <label><?php echo (tep_not_null(ENTRY_FIRST_NAME_TEXT) ? '<sup class="inputRequirement">' . ENTRY_FIRST_NAME_TEXT . '</sup>': '') . ENTRY_FIRST_NAME; ?></label>
        <?php echo tep_draw_input_field('firstname', $account['customers_firstname']); ?> </div>
      <div class="form-group">
        <label><?php echo (tep_not_null(ENTRY_LAST_NAME_TEXT) ? '<sup class="inputRequirement">' . ENTRY_LAST_NAME_TEXT . '</sup>': '') . ENTRY_LAST_NAME; ?></label>
        <?php echo tep_draw_input_field('lastname', $account['customers_lastname']); ?> </div>
      <?php
            	if (ACCOUNT_DOB == 'true') {
            ?>
      <div class="form-group">
        <label><?php echo ENTRY_DATE_OF_BIRTH . (tep_not_null(ENTRY_DATE_OF_BIRTH_TEXT) ? '<sup class="inputRequirement">' . ENTRY_DATE_OF_BIRTH_TEXT . '</sup>': ''); ?></label>
        <?php echo tep_draw_input_field('dob', tep_date_short($account['customers_dob']), 'id="dob"'); ?> 
        <script type="text/javascript">$('#dob').datepicker({dateFormat: '<?php echo JQUERY_DATEPICKER_FORMAT; ?>', changeMonth: true, changeYear: true, yearRange: '-100:+0'});</script> 
      </div>
      <?php
              }
            ?>
      <div class="form-group">
        <label><?php echo (tep_not_null(ENTRY_EMAIL_ADDRESS_TEXT) ? '<sup class="inputRequirement">' . ENTRY_EMAIL_ADDRESS_TEXT . '</sup>': '') . ENTRY_EMAIL_ADDRESS; ?></label>
        <?php echo tep_draw_input_field('email_address', $account['customers_email_address']); ?> </div>
      <div class="form-group">
        <label><?php echo (tep_not_null(ENTRY_TELEPHONE_NUMBER_TEXT) ? '<sup class="inputRequirement">' . ENTRY_TELEPHONE_NUMBER_TEXT . '</sup>': '') . ENTRY_TELEPHONE_NUMBER; ?></label>
        <?php echo tep_draw_input_field('telephone', $account['customers_telephone']); ?> </div>
      <div class="form-group">
        <label><?php echo (tep_not_null(ENTRY_FAX_NUMBER_TEXT) ? '<sup class="inputRequirement">' . ENTRY_FAX_NUMBER_TEXT . '</sup>': '') . ENTRY_FAX_NUMBER; ?></label>
        <?php echo tep_draw_input_field('fax', $account['customers_fax']); ?> </div>
    </div>
  </div>
  <div class="buttonSet button-container"> <?php echo tep_draw_button(IMAGE_BUTTON_BACK, 'btn btn-default', tep_href_link(FILENAME_ACCOUNT, '', 'SSL')); ?> <span class="pull-right"><?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'btn btn-default', null, 'primary'); ?></span> </div>
</div>
</form>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
