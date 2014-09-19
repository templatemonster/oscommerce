<div class="contentContainer <?php echo (MODULE_CONTENT_LOGIN_FORM_CONTENT_WIDTH == 'Half') ? 'col-xs-6' : 'col-xs-12'; ?>">
	<div class="box">
		<h2 class="page-subheading"><?php echo MODULE_CONTENT_LOGIN_HEADING_RETURNING_CUSTOMER; ?></h2>
		<p><?php echo MODULE_CONTENT_LOGIN_TEXT_RETURNING_CUSTOMER; ?></p>

		<?php echo tep_draw_form('login', tep_href_link(FILENAME_LOGIN, 'action=process', 'SSL'), 'post', '', true); ?>

            <div class="form-group">
            	<label><?php echo ENTRY_EMAIL_ADDRESS; ?></label>
                <?php echo tep_draw_input_field('email_address'); ?>
            </div>
            <div class="form-group">
            	<label><?php echo ENTRY_PASSWORD; ?></label>
                <?php echo tep_draw_password_field('password'); ?>
            </div>
    
            <p><?php echo '<a class="btn-link" href="' . tep_href_link(FILENAME_PASSWORD_FORGOTTEN, '', 'SSL') . '">' . MODULE_CONTENT_LOGIN_TEXT_PASSWORD_FORGOTTEN . '</a>'; ?></p>
            <div class="text-right"><?php echo tep_draw_button(IMAGE_BUTTON_LOGIN, 'key btn btn-default', null, 'primary'); ?></div>

		</form>
	</div>
</div>
