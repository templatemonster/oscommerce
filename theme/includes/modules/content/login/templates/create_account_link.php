<div class="contentContainer <?php echo (MODULE_CONTENT_CREATE_ACCOUNT_LINK_CONTENT_WIDTH == 'Half') ? 'col-xs-6' : 'col-xs-12'; ?>">
	<div class="box">
    	<h2 class="page-subheading"><?php echo MODULE_CONTENT_LOGIN_HEADING_NEW_CUSTOMER; ?></h2>
        <p><strong><?php echo MODULE_CONTENT_LOGIN_TEXT_NEW_CUSTOMER; ?></strong></p>
        <p><?php echo MODULE_CONTENT_LOGIN_TEXT_NEW_CUSTOMER_INTRODUCTION; ?></p>
        
        <div class="text-right"><?php echo tep_draw_button(IMAGE_BUTTON_CONTINUE, 'btn btn-default', tep_href_link(FILENAME_CREATE_ACCOUNT, '', 'SSL')); ?></div>
    </div>
</div>
