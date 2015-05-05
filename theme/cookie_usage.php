<?php
  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_COOKIE_USAGE);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_COOKIE_USAGE));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content bottom-indent">
  <div class="row">
    <div class="col-xs-8"> <?php echo TEXT_INFORMATION; ?> </div>
    <div class="col-xs-4">
      <div class="box">
        <h3 class="page-subheading"><?php echo BOX_INFORMATION_HEADING; ?></h3>
        <div> <?php echo BOX_INFORMATION; ?> </div>
      </div>
    </div>
  </div>
</div>
<div class="buttonSet button-container clearfix"> <?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'btn btn-default', tep_href_link(FILENAME_DEFAULT)); ?> </div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
