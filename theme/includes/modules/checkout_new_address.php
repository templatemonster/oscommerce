<?php
  if (!isset($process)) $process = false;
?>
<?php
  if (ACCOUNT_GENDER == 'true') {
    if (isset($gender)) {
      $male = ($gender == 'm') ? true : false;
      $female = ($gender == 'f') ? true : false;
    } else {
      $male = false;
      $female = false;
    }
?>

<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_GENDER_TEXT) ? '<sup class="inputRequirement">' . ENTRY_GENDER_TEXT . '</sup>': '') . ENTRY_GENDER; ?></label>
  <?php echo tep_draw_radio_field('gender', 'm', $male) . '&nbsp;&nbsp;' . MALE . '&nbsp;&nbsp;' . tep_draw_radio_field('gender', 'f', $female) . '&nbsp;&nbsp;' . FEMALE; ?> </div>
<?php
  }
?>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_FIRST_NAME_TEXT) ? '<sup class="inputRequirement">' . ENTRY_FIRST_NAME_TEXT . '</sup>': '') . ENTRY_FIRST_NAME; ?></label>
  <?php echo tep_draw_input_field('firstname'); ?> </div>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_LAST_NAME_TEXT) ? '<sup class="inputRequirement">' . ENTRY_LAST_NAME_TEXT . '</sup>': '').ENTRY_LAST_NAME; ?></label>
  <?php echo tep_draw_input_field('lastname'); ?> </div>
<?php
  if (ACCOUNT_COMPANY == 'true') {
?>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_COMPANY_TEXT) ? '<sup class="inputRequirement">' . ENTRY_COMPANY_TEXT . '</sup>': '').ENTRY_COMPANY; ?></label>
  <?php echo tep_draw_input_field('company'); ?> </div>
<?php
  }
?>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_STREET_ADDRESS_TEXT) ? '<sup class="inputRequirement">' . ENTRY_STREET_ADDRESS_TEXT . '</sup>': '').ENTRY_STREET_ADDRESS; ?></label>
  <?php echo tep_draw_input_field('street_address'); ?> </div>
<?php
  if (ACCOUNT_SUBURB == 'true') {
?>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_SUBURB_TEXT) ? '<sup class="inputRequirement">' . ENTRY_SUBURB_TEXT . '</sup>': '').ENTRY_SUBURB; ?></label>
  <?php echo tep_draw_input_field('suburb'); ?> </div>
<?php
  }
?>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_POST_CODE_TEXT) ? '<sup class="inputRequirement">' . ENTRY_POST_CODE_TEXT . '</sup>': '').ENTRY_POST_CODE; ?></label>
  <?php echo tep_draw_input_field('postcode'); ?> </div>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_CITY_TEXT) ? '<sup class="inputRequirement">' . ENTRY_CITY_TEXT . '</sup>': '').ENTRY_CITY; ?></label>
  <?php echo tep_draw_input_field('city'); ?> </div>
<?php
  if (ACCOUNT_STATE == 'true') {
?>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_STATE_TEXT) ? '<sup class="inputRequirement">'  . ENTRY_STATE_TEXT . '</sup>':'').ENTRY_STATE; ?></label>
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
      echo tep_draw_input_field('state');
    }
?>
</div>
<?php
  }
?>
<div class="form-group">
  <label><?php echo (tep_not_null(ENTRY_COUNTRY_TEXT) ? '<sup class="inputRequirement">' . ENTRY_COUNTRY_TEXT . '</sup>': '').ENTRY_COUNTRY; ?></label>
  <?php echo tep_get_country_list('country', STORE_COUNTRY); ?> </div>
