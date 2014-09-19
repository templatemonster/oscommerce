<?php
	if ($messageStack->size('header') > 0) {
		echo '<div class="container">' . $messageStack->output('header') . '</div>';
	}
?>

<?php
	//if(isset($new_products_id_in_cart) && $new_products_id_in_cart) {
		//tep_addcart_popup($new_products_id_in_cart);	
	//}
?>

<div class="header-wrapper"> <!-- header wrapper start -->
  <div id="header" class="container">
    <?php if ($oscTemplate->hasBlocks('header_top')) { ?>
    <div class="topRow clearfix"> <?php echo $oscTemplate->getBlocks('header_top');?> </div>
    <?php } ?>
    <div class="row">
      <div class="col-xs-12">
        <div id="storeLogo" class="col-xs-3"><?php echo '<a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . tep_image(DIR_WS_IMAGES . 'store_logo.png', STORE_NAME) . '</a>'; ?></div>
        <?php if ($oscTemplate->hasBlocks('header')) { ?>
        <?php echo $oscTemplate->getBlocks('header');?>
        <?php } ?>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <?php if (($oscTemplate->hasBlocks('boxes_under_header')) ) { echo $oscTemplate->getBlocks('boxes_under_header');} ?>
      </div>
    </div>
  </div>
</div>
<?php if (isset($current_page) && $current_page == FILENAME_DEFAULT) { } else {?>
<!-- header wrapper end -->
<div class="container"> <!-- breadcrumbs start -->
  <div class="row">
    <div class="col-xs-12">
      <ul class="breadcrumb">
        <?php echo '' . $breadcrumb->trail(''); ?>
      </ul>
    </div>
  </div>
</div>
<!-- breadcrumbs end -->
<?php  }?>
<?php
  if (isset($HTTP_GET_VARS['error_message']) && tep_not_null($HTTP_GET_VARS['error_message'])) {
?>
<div class="container">
  <div class="alert alert-danger"><?php echo htmlspecialchars(stripslashes(urldecode($HTTP_GET_VARS['error_message']))); ?></div>
</div>
<?php
  }

  if (isset($HTTP_GET_VARS['info_message']) && tep_not_null($HTTP_GET_VARS['info_message'])) {
?>
<div class="container">
  <div class="alert alert-info"><?php echo htmlspecialchars(stripslashes(urldecode($HTTP_GET_VARS['info_message']))); ?></div>
</div>
<?php
  }
?>
