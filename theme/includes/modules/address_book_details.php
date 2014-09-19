<?php
  if (!isset($process)) $process = false;
?>

<p class="require text-right"><?php echo FORM_REQUIRED_INFORMATION; ?></p>
<h2 class="page-subheading"><?php echo NEW_ADDRESS_TITLE; ?></h2>
<div class="content-box">
  <?php
  if (ACCOUNT_GENDER == 'true') {
    $male = $female = false;
    if (isset($gender)) {
      $male = ($gender == 'm') ? true : false;
      $female = !$male;
    } elseif (isset($entry['entry_gender'])) {
      $male = ($entry['entry_gender'] == 'm') ? true : false;
      $female = !$male;
    }
?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_GENDER_TEXT) ? '<sup class="inputRequirement">' . ENTRY_GENDER_TEXT . '</sup>': '') . ENTRY_GENDER; ?></label>
    <?php echo tep_draw_radio_field('gender', 'm', $male) . '&nbsp;&nbsp;' . MALE . '&nbsp;&nbsp;' . tep_draw_radio_field('gender', 'f', $female) . '&nbsp;&nbsp;' . FEMALE ; ?> </div>
  <?php
      }
    ?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_FIRST_NAME_TEXT) ? '<sup class="inputRequirement">' . ENTRY_FIRST_NAME_TEXT . '</sup>': '') . ENTRY_FIRST_NAME; ?></label>
    <?php echo tep_draw_input_field('firstname', (isset($entry['entry_firstname']) ? $entry['entry_firstname'] : '')); ?> </div>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_LAST_NAME_TEXT) ? '<sup class="inputRequirement">' . ENTRY_LAST_NAME_TEXT . '</sup>': '') .ENTRY_LAST_NAME; ?></label>
    <?php echo tep_draw_input_field('lastname', (isset($entry['entry_lastname']) ? $entry['entry_lastname'] : '')); ?> </div>
  <?php
  if (ACCOUNT_COMPANY == 'true') {
?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_COMPANY_TEXT) ? '<sup class="inputRequirement">' . ENTRY_COMPANY_TEXT . '</sup>': '') . ENTRY_COMPANY; ?></label>
    <?php echo tep_draw_input_field('company', (isset($entry['entry_company']) ? $entry['entry_company'] : '')); ?> </div>
  <?php
  }
?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_STREET_ADDRESS_TEXT) ? '<sup class="inputRequirement">' . ENTRY_STREET_ADDRESS_TEXT . '</sup>': '') . ENTRY_STREET_ADDRESS; ?></label>
    <?php echo tep_draw_input_field('street_address', (isset($entry['entry_street_address']) ? $entry['entry_street_address'] : '')); ?> </div>
  <?php
  if (ACCOUNT_SUBURB == 'true') {
?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_SUBURB_TEXT) ? '<sup class="inputRequirement">' . ENTRY_SUBURB_TEXT . '</sup>': '') . ENTRY_SUBURB; ?></label>
    <?php echo tep_draw_input_field('suburb', (isset($entry['entry_suburb']) ? $entry['entry_suburb'] : ''));?> </div>
  <?php
  }
?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_POST_CODE_TEXT) ? '<sup class="inputRequirement">' . ENTRY_POST_CODE_TEXT . '</sup>': '') . ENTRY_POST_CODE; ?></label>
    <?php echo tep_draw_input_field('postcode', (isset($entry['entry_postcode']) ? $entry['entry_postcode'] : '')); ?> </div>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_CITY_TEXT) ? '<sup class="inputRequirement">' . ENTRY_CITY_TEXT . '</sup>': '') . ENTRY_CITY; ?></label>
    <?php echo tep_draw_input_field('city', (isset($entry['entry_city']) ? $entry['entry_city'] : '')); ?> </div>
  <?php
  if (ACCOUNT_STATE == 'true') {
?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_STATE_TEXT) ? '<sup class="inputRequirement">':'') . ENTRY_STATE_TEXT . '</sup>'. ENTRY_STATE; ?></label>
    <?php
    if ($process == true) {
      if ($entry_state_has_zones == true) {
        $zones_array = array();
        $zones_query = tep_db_query("select zone_name from " . TABLE_ZONES . " where zone_country_id = '" . (int)$country . "' order by zone_name");
        while ($zones_values = tep_db_fetch_array($zones_query)) {
          $zones_array[] = array('id' => $zones_values['zone_name'], 'text' => $zones_values['zone_name']);
        }
        echo tep_draw_pull_down_menu('state', $zones_array);
      } else {
        echo tep_draw_input_field('state');
      }
    } else {
      echo tep_draw_input_field('state', (isset($entry['entry_country_id']) ? tep_get_zone_name($entry['entry_country_id'], $entry['entry_zone_id'], $entry['entry_state']) : ''));
	}
?>
  </div>
  <?php
  }
?>
  <div class="form-group">
    <label><?php echo (tep_not_null(ENTRY_COUNTRY_TEXT) ? '<sup class="inputRequirement">' . ENTRY_COUNTRY_TEXT . '</sup>': '') . ENTRY_COUNTRY; ?></label>
    <?php echo tep_get_country_list('country', (isset($entry['entry_country_id']) ? $entry['entry_country_id'] : STORE_COUNTRY)); ?> </div>
  <?php
  if ((isset($HTTP_GET_VARS['edit']) && ($customer_default_address_id != $HTTP_GET_VARS['edit'])) || (isset($HTTP_GET_VARS['edit']) == false) ) {
?>
  <div class="checkbox">
    <label> <?php echo tep_draw_checkbox_field('primary', 'on', false, 'id="primary"'); ?> <?php echo SET_AS_PRIMARY; ?> </label>
  </div>
  <?php
  }
?>
</div>
