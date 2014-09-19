<?php
	require(DIR_WS_INCLUDES . 'counter.php');
?>

<div class="container">
	<div class="footer">
		<?php if (($oscTemplate->hasBlocks('boxes_footer')))	{?> 
			<div class="footer-boxes"><div class="row"><?php echo $oscTemplate->getBlocks('boxes_footer'); ?></div></div>
		<?php } ?> 
        <p class="footer-copyright"><?php echo FOOTER_TEXT_BODY ?></p>
    </div>
</div>