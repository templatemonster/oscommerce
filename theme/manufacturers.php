<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_MANUFACTURERS);
  $current_page = FILENAME_MANUFACTURERS;
  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_MANUFACTURERS));

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

<h1 class="page-heading"><?php echo HEADING_TITLE; ?></h1>
<div class="block-content manufacturers-listing">
  <?php
	$manufacturers_query = tep_db_query("select m.manufacturers_id, m.manufacturers_name, m.manufacturers_image, mi.manufacturers_url, COUNT(*) as total from " . TABLE_MANUFACTURERS . " m left join " . TABLE_MANUFACTURERS_INFO . " mi on (m.manufacturers_id = mi.manufacturers_id and mi.languages_id = '" . (int)$languages_id . "'), " . TABLE_PRODUCTS . " p where m.manufacturers_id = p.manufacturers_id GROUP BY manufacturers_id order by manufacturers_name");	
	
	if ($number_of_rows = tep_db_num_rows($manufacturers_query)) {
		$manufacturers_list = '<ul class="row">';
		while ($manufacturers = tep_db_fetch_array($manufacturers_query)) {
			$manufacturers_list .= '<li class="col-xs-12">'.
								   '	<div class="inner-content">'.
								   '		<div class="row">';
												$manufacturers_list .= '<div class="col-xs-3 minheight">';
												if (tep_not_null($manufacturers['manufacturers_image']) && $manufacturers['manufacturers_url']) {
													$manufacturers_list .=  '<a href="'.$manufacturers['manufacturers_url'].'">'.tep_image(DIR_WS_IMAGES . $manufacturers['manufacturers_image'], $manufacturers['manufacturers_name'], '', '', '').'</a>';
												} elseif (tep_not_null($manufacturers['manufacturers_image'])) {
													$manufacturers_list .=  tep_image(DIR_WS_IMAGES . $manufacturers['manufacturers_image'], $manufacturers['manufacturers_name'], '', '', '');	
												}
												$manufacturers_list .= '</div>';
												$manufacturers_list .= '<div class="col-xs-6 minheight">';
												$manufacturers_list .= '	<a class="product-name" href="' . tep_href_link(FILENAME_DEFAULT, 'manufacturers_id=' . $manufacturers['manufacturers_id']) . '">' . $manufacturers['manufacturers_name'] .'</a>';
												$manufacturers_list .= '</div>';
												if	($manufacturers['total'] > 1)	{
												  $text_info	= TEXT_INFO_S;	
												}else{
												  $text_info	= TEXT_INFO;
												}
												$manufacturers_list .= '<div class="col-xs-3 minheight products-link">';
												$manufacturers_list .= tep_draw_button($manufacturers['total'].' '.$text_info, 'info btn btn-default', tep_href_link(FILENAME_DEFAULT, 'manufacturers_id=' . $manufacturers['manufacturers_id']));
												$manufacturers_list .= '</div>';
			$manufacturers_list .= '		</div>'.
								   '	</div>'.
								   '</li>';
		}		  
		$manufacturers_list .= '</ul>';
				
		echo $manufacturers_list;				

} else {
	echo '<div class="alert alert-info">'.TEXT_NO_MANUFACTURERS.'</div>';	  
}
?>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
