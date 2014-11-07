<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2014 osCommerce

  Released under the GNU General Public License
*/

   $oscTemplate->buildBlocks();

  if (!$oscTemplate->hasBlocks('boxes_column_left')) {
    $oscTemplate->setGridContentWidth($oscTemplate->getGridContentWidth() + $oscTemplate->getGridColumnWidth());

  }
  
  if (!$oscTemplate->hasBlocks('boxes_column_right')) {
    $oscTemplate->setGridContentWidth($oscTemplate->getGridContentWidth() + $oscTemplate->getGridColumnWidth());
  }
  
  if ($oscTemplate->hasBlocks('boxes_column_left')) {
	  $oscTemplate->setProductPerLine($oscTemplate->getProductPerLine() - 1);
  }
  if ($oscTemplate->hasBlocks('boxes_column_right')) {
	  $oscTemplate->setProductPerLine($oscTemplate->getProductPerLine() - 1);
  }

?>
<!DOCTYPE html>
<html <?php echo HTML_PARAMS; ?>>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title><?php echo tep_output_string_protected($oscTemplate->getTitle()); ?></title>
		<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>" />
        <link rel="icon" type="image/png" href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG.DIR_WS_IMAGES; ?>favicon.ico" />
		<link rel="stylesheet" type="text/css" href="ext/jquery/ui/redmond/jquery-ui-1.10.4.min.css" />
		<script type="text/javascript" src="ext/jquery/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="ext/jquery/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript" src="ext/jquery/ui/jquery-ui-1.10.4.min.js"></script>

		<?php
			if (tep_not_null(JQUERY_DATEPICKER_I18N_CODE)) {
		?>
		<script type="text/javascript" src="ext/jquery/ui/i18n/jquery.ui.datepicker-<?php echo JQUERY_DATEPICKER_I18N_CODE; ?>.js"></script>
		<script type="text/javascript">
			$.datepicker.setDefaults($.datepicker.regional['<?php echo JQUERY_DATEPICKER_I18N_CODE; ?>']);
		</script>
<?php }?>
		<script type="text/javascript" src="ext/colorbox/jquery.colorbox-min.js"></script>
        <script type="text/javascript" src="ext/elevateZoom/jquery.elevatezoom.js"></script>
        <script type="text/javascript" src="ext/fancybox/jquery.fancybox-1.3.4.js"></script>
        <script type="text/javascript" src="ext/fancybox/jquery.easing-1.3.pack.js"></script>
        <script type="text/javascript" src="ext/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
        <script type="text/javascript" src="ext/bxslider/jquery.bxslider.js"></script>
        <script type="text/javascript" src="ext/totalStorage/total-storage.min.js"></script>
        <script type="text/javascript" src="ext/jquery/jQuery.equalHeights.min.js"></script>
        <script type="text/javascript" src="ext/jquery/jquery.uniform/jquery.uniform.min.js"></script>
        <script type="text/javascript" src="includes/scirpt.js"></script>
        
        <!-- Nivo Slider -->
			<script type="text/javascript" src="ext/jquery/jquery.nivo.slider.js"></script>
            <link rel="stylesheet" type="text/css" href="css/nivo-slider.css" />
        <!-- Nivo Slider -->

		<link rel="stylesheet" type="text/css" href="ext/colorbox/colorbox.css" />
        <link rel="stylesheet" type="text/css" href="ext/fancybox/jquery.fancybox-1.3.4.css" />
        <link rel="stylesheet" type="text/css" href="ext/bxslider/jquery.bxslider.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/font/font-awesome.css" />
        <link rel="stylesheet" type="text/css" href="css/uniform/uniform.default.css" />
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600italic,600,700,700italic,800,800italic&subset=latin,cyrillic-ext,greek-ext,latin-ext' rel='stylesheet' type='text/css'>
        <?php // Start superfish categories box  ?>
		  <script type="text/javascript" src="ext/jquery/superfish/js/jquery.hoverIntent.minified.js"></script>
          <script type="text/javascript" src="ext/jquery/superfish/js/superfish.js"></script>
          <script type="text/javascript" src="ext/jquery/stickup/stickup-menu.js"></script>
          <script type="text/javascript">
			$(document).ready(function(){
	
				var path = window.location.href;
	
				if (path !== undefined) {
					$(".colmn-categories li").has('ul').addClass('hasChild');
					$(".colmn-categories ul, .sf-menu").find("a[href='" + path + "']").parents('li').addClass('active').children('a').addClass('active');
					function categoriesToggle(){
						$(".colmn-categories ul").each(function() {
                            if($(this).parent().hasClass('active')) {
								$(this).show().prev('i').addClass('opened');	
							}
                        });
						$(".colmn-categories i").on('click',function() {
                            if($(this).hasClass('opened')) {
								$(this).next('ul').slideUp(function(){
									$(this).prev().removeClass('opened').addClass('closed');
								});	
							} else {
								$(this).next('ul').slideDown(function(){
									$(this).prev().removeClass('closed').addClass('opened');
								});	
							}
                        });
						$(".colmn-categories i").hover(
							function(){$(this).prev('a').addClass('hovered')},
							function(){$(this).prev('a').removeClass('hovered')}
						);
					}
				}
				$('.sf-menu > li > ul').each(function(){
					i = 0;
					//add classes for clearing
						$(this).find('>li').each(function(){ 
							i++;
							if (i % 5 == 1)
								$(this).addClass('first-in-line-lg');
	
						});
				});
				categoriesToggle();
				
				var stickMenu = false;
				if(stickMenu) {
					$('.sf-menu').tmStickUp();
				}
			});
          </script>
          <script type="text/javascript">
		  	productWidth = <?php echo $oscTemplate->getProductWidth()?>;
		  </script>
          <link rel="stylesheet" media="screen" href="css/superfish.css" />
        <?php // End superfish categories box  ?>
        <?php echo $oscTemplate->getBlocks('header_tags'); ?>
	</head>
<body>
    	<!--[if lt IE 9]>
        <div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div>
		<![endif]-->
<div id="bodyWrapper">
	<?php require(DIR_WS_INCLUDES . 'header.php'); ?>

	<div class="content-wrapper">
		<div id="bodyContent" class="container">
        	<div class="row">
            	<?php
					if ($oscTemplate->hasBlocks('boxes_column_left')) {
				?>
				
                    <div id="columnLeft" class="col-xs-<?php echo $oscTemplate->getGridColumnWidth(); ?>">
                        <?php echo $oscTemplate->getBlocks('boxes_column_left'); ?>
                    </div>
				<?php 
					}
				?>
    			<div id="centerColumn" class="<?php  echo 'col-xs-'.$oscTemplate->getGridContentWidth();?>">