<?php
  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_SHIPPING);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_SHIPPING));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content returns">
  <div class="bottom-indent"> <?php echo TEXT_INFORMATION; ?> </div>
  <div class="buttonSet button-container"> <?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'btn btn-default', tep_href_link(FILENAME_DEFAULT)); ?> </div>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
