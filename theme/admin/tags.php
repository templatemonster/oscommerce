<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2010 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_CLASSES . 'currencies.php');
  $currencies = new currencies();

  $action = (isset($HTTP_GET_VARS['action']) ? $HTTP_GET_VARS['action'] : '');

  if (tep_not_null($action)) {
    switch ($action) {
      case 'update':
        $products_id = tep_db_prepare_input($HTTP_POST_VARS['products_id']);
        $tags_name = tep_db_prepare_input($HTTP_POST_VARS['tags_name']);
				//echo "tags_name=".$tags_name."<br/>";
        $tags_arr=explode(",", $tags_name);
        foreach ($tags_arr as $tag) {
          $flag_tag=0;
          $flag_tag_product=0;
          $tag_id=null;
	  			//check if tag is already there
          $tags_query = tep_db_query("select * from ". TABLE_TAGS ." where tag_text='".urlencode($tag)."'" );
          while ($tags = tep_db_fetch_array($tags_query)) {
            $flag_tag=1;
            $tag_id=$tags['tag_id'];
          }
	  			//not found: insert it!
          if($flag_tag==0){
            tep_db_query("insert into ". TABLE_TAGS ." (tag_text) values ('".urlencode($tag)."')");
            //echo "insert into ". TABLE_TAGS ." (tag_text) values ('".urlencode($tag)."')"."<br/>";
          }
	  			//fetch (new) tag_id
          $tags_query = tep_db_query("select * from ". TABLE_TAGS ." where tag_text='".urlencode($tag)."'" );
          while ($tags = tep_db_fetch_array($tags_query)) {
            $tag_id=$tags['tag_id'];
          }
	  			//check products-tags relationship
          $tags_query = tep_db_query("select * from ". TABLE_PRODUCTS_TAGS ." where tag_id='".$tag_id."' and products_id='".$products_id."'" );
          while ($tags = tep_db_fetch_array($tags_query)) {
            $flag_tag_product=1;
          }
	  			//no current relationship: insert it! 
          if($flag_tag_product==0) {
            tep_db_query("insert into ". TABLE_PRODUCTS_TAGS ." (products_id,tag_id) values ('".$products_id."','".$tag_id."')");
            //echo "insert into ". TABLE_PRODUCTS_TAGS ." (products_id,tag_id) values ('".$products_id."','".$tag_id."')"."<br/>";
          }
        }
				//NEW AMC1: when in tags_arr there are less tags than in products_tags, these lines should be deleted.
        $tags_query = tep_db_query("select * from ". TABLE_PRODUCTS_TAGS ." p, ". TABLE_TAGS ." t where p.products_id='".$products_id."' and p.tag_id = t.tag_id" );
        while ($tags = tep_db_fetch_array($tags_query)) {
          $tag_id=$tags['tag_id'];
          $tag_text=$tags['tag_text'];
          $flag_tag_product=0;
					//echo urldecode($tag_text) ." in_array ". implode(",",$tags_arr)."<br/>";
					if(in_array(urldecode($tag_text),$tags_arr)) {
              $flag_tag_product=1;
					}
	  			//a products_tags tag was not found in request (tags_arr): delete it!
	  			if($flag_tag_product==0) {
            tep_db_query("delete from ". TABLE_PRODUCTS_TAGS ." where tag_id='". $tag_id ."' and products_id='". $products_id ."'");
            //echo "delete from ". TABLE_PRODUCTS_TAGS ." where tag_id='". $tag_id ."' and products_id='". $products_id ."'"."<br/>";
	  			}
        }
        //NEW AMC2: if a tag_id in tags is not found in products_tags, it should be deleted as well.
        $tags_query = tep_db_query("select * from ". TABLE_TAGS);
        while ($tags = tep_db_fetch_array($tags_query)) {
          $flag_tag=0;
          $tag_id=$tags['tag_id'];
          $products_tags_query = tep_db_query("select tag_id from ". TABLE_PRODUCTS_TAGS ." where tag_id='". $tag_id ."'");
          while (tep_db_fetch_array($products_tags_query)) {
            $flag_tag=1;
          }
	  			//a tag in tags has not been found in products_tags: delete it!
	  			if($flag_tag==0) {
            tep_db_query("delete from ". TABLE_TAGS ." where tag_id='". $tag_id ."'");
            //echo "delete from ". TABLE_TAGS ." where tag_id='". $tag_id ."'"."<br/>";
	  			}
        }
        tep_redirect(tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $tag_id));
        break;
      case 'deleteconfirm':
        $tag_id = tep_db_prepare_input($HTTP_GET_VARS['sID']);

        tep_db_query("delete from products_tags where products_id = '" . (int)$tag_id . "'");

        tep_redirect(tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page']));
        break;
    }
  }

  require(DIR_WS_INCLUDES . 'template_top.php');
?>

    <table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td width="100%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo MODULE_BOXES_TAG_TITLE; ?></td>
            <td class="pageHeading" align="right"><?php echo tep_draw_separator('pixel_trans.gif', HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT); ?></td>
          </tr>
        </table></td>
      </tr>
<?php
  if ( ($action == 'new') || ($action == 'edit') ) {
    $form_action = 'insert';
    if ( ($action == 'edit') && isset($HTTP_GET_VARS['sID']) ) {
      $form_action = 'update';
      
      $product_query = tep_db_query("select p.products_id, pd.products_name, p.products_price from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' and p.products_id  = '" . (int)$HTTP_GET_VARS['sID'] . "'");
      $product = tep_db_fetch_array($product_query);

      $sInfo = new objectInfo($product);
    } else {
      $sInfo = new objectInfo(array());

// create an array of products on tag, which will be excluded from the pull down menu of products
// (when creating a new product on tag)
      $tags_array = array();
      $tags_query = tep_db_query("select p.products_id from " . TABLE_PRODUCTS );
      while ($tags = tep_db_fetch_array($tags_query)) {
        $tags_array[] = $tags['products_id'];
      }
    }
?>
      <tr><form name="new_tag" <?php echo 'action="' . tep_href_link(FILENAME_TAGS, tep_get_all_get_params(array('action', 'info', 'sID')) . 'action=' . $form_action, 'NONSSL') . '"'; ?> method="post"><?php if ($form_action == 'update') echo tep_draw_hidden_field('products_id', $HTTP_GET_VARS['sID']); ?>
        <td><br /><table border="0" cellspacing="0" cellpadding="2">
          <tr>

              <td class="main"><strong><?php echo MODULE_BOXES_TAG_TEXT_PRODUCT; ?>:&nbsp;</strong></td>
            <td class="main"><?php echo (isset($sInfo->products_name)) ? $sInfo->products_name  : tep_draw_products_pull_down('products_id', 'style="font-size:10px"'); ?></td>
          </tr>

        </table>

        </td>
      </tr>
       <?php $tags="";
          $tags_query = tep_db_query("select t.tag_text from tags t,products_tags p where p.tag_id=t.tag_id and p.products_id='".$sInfo->products_id."'" );
                  while ($tags_result = tep_db_fetch_array($tags_query)) {
                        $tags.=urldecode($tags_result['tag_text']).",";
                }
                $tags=substr($tags, 0, -1);
                ?>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
               
          <tr>

            <td class="main"><br /><?php echo MODULE_BOXES_TAG_TITLE; ?> <br /><?php echo tep_draw_input_field('tags_name');?></td>
          <script type="text/javascript">
 var t='<?php echo $tags?>';
              
              document.new_tag.tags_name.value = t;
</script>

            <td class="smallText" align="right" valign="top"><br /><?php echo tep_draw_button(IMAGE_SAVE, 'disk', null, 'primary') . tep_draw_button(IMAGE_CANCEL, 'close', tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . (isset($HTTP_GET_VARS['sID']) ? '&sID=' . $HTTP_GET_VARS['sID'] : ''))); ?></td>
          </tr>
           <tr>
	   <td class="main" ><strong><?php echo MODULE_BOXES_TAG_INSERT_NOTES; ?>:</strong></td>
                </tr>
                <tr>
		<td class="main" ><strong>*</strong><?php echo MODULE_BOXES_TAG_INSERT_TEXT; ?><td>
                </tr>
        </table></td>
      </form></tr>
<?php
  } else {
?>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent"><?php echo MODULE_BOXES_TAG_TEXT_PRODUCT; ?></td>
                 <td class="dataTableHeadingContent" align="right"><?php echo MODULE_BOXES_TAG_TEXT_ACTION; ?>&nbsp;</td>
              </tr>
<?php
    $tags_query_raw = "select p.products_id, pd.products_name, p.products_price , p.products_model , p.products_date_added from " . TABLE_PRODUCTS . " p,  " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "'  order by pd.products_name";
    $tags_split = new splitPageResults($HTTP_GET_VARS['page'], MAX_DISPLAY_SEARCH_RESULTS, $tags_query_raw, $tags_query_numrows);
    $tags_query = tep_db_query($tags_query_raw);
    while ($tags = tep_db_fetch_array($tags_query)) {
      if ((!isset($HTTP_GET_VARS['sID']) || (isset($HTTP_GET_VARS['sID']) && ($HTTP_GET_VARS['sID'] == $tags['products_id']))) && !isset($sInfo)) {
        $products_query = tep_db_query("select products_image from " . TABLE_PRODUCTS . " where products_id = '" . (int)$tags['products_id'] . "'");
        $products = tep_db_fetch_array($products_query);
        $sInfo_array = array_merge($tags, $products);
        $sInfo = new objectInfo($sInfo_array);
      }

      if (isset($sInfo) && is_object($sInfo) && ($tags['products_id'] == $sInfo->products_id)) {
        echo '                  <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $sInfo->products_id . '&action=edit') . '\'">' . "\n";
      } else {
        echo '                  <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $tags['products_id']) . '\'">' . "\n";
      }
?>
                <td  class="dataTableContent"><?php echo $tags['products_name']; ?></td>

                <td class="dataTableContent" align="right"><?php if (isset($sInfo) && is_object($sInfo) && ($tags['products_id'] == $sInfo->products_id)) { echo tep_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', ''); } else { echo '<a href="' . tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $tags['products_id']) . '">' . tep_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>'; } ?>&nbsp;</td>
      </tr>
<?php
    }
?>
              <tr>
                <td colspan="4"><table border="0" width="100%" cellpadding="0"cellspacing="2">
                  <tr>
                    <td class="smallText" valign="top"><?php echo $tags_split->display_count($tags_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, $HTTP_GET_VARS['page'], TEXT_DISPLAY_NUMBER_OF_SPECIALS); ?></td>
                    <td class="smallText" align="right"><?php echo $tags_split->display_links($tags_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, MAX_DISPLAY_PAGE_LINKS, $HTTP_GET_VARS['page']); ?></td>
                  </tr>
<?php
  if (empty($action)) {
?>
                  
<?php
  }
?>
                </table></td>
              </tr>
            </table></td>
<?php
  $heading = array();
  $contents = array();

  switch ($action) {
    case 'delete':
      $heading[] = array('text' => '<strong>'. MODULE_BOXES_TAG_TEXT_DELETE .'</strong>');

      $contents = array('form' => tep_draw_form('tags', FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $sInfo->products_id . '&action=deleteconfirm'));
      $contents[] = array('text' => MODULE_BOXES_TAG_DELETE_WARNING);
      $contents[] = array('text' => '<br /><strong>' . $sInfo->products_name . '</strong>');
      $contents[] = array('align' => 'center', 'text' => '<br />' . tep_draw_button(IMAGE_DELETE, 'trash', null, 'primary') . tep_draw_button(IMAGE_CANCEL, 'close', tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $sInfo->products_id)));
      break;
    default:
      if (is_object($sInfo)) {
        $tags="";
        $tags_query = tep_db_query("select * from ". TABLE_TAGS ." t, ". TABLE_PRODUCTS_TAGS ." p where p.tag_id=t.tag_id and p.products_id='".$sInfo->products_id."'" );
        while ($tags_result = tep_db_fetch_array($tags_query)) {
          $tags.=urldecode($tags_result['tag_text']).",";
        }
        $tags=substr($tags, 0, -1);
        $heading[] = array('text' => '<strong>' . $sInfo->products_name . '</strong>');
        $contents[] = array('align' => 'center', 'text' => tep_draw_button(IMAGE_EDIT, 'document', tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $sInfo->products_id . '&action=edit')) . tep_draw_button(IMAGE_DELETE, 'trash', tep_href_link(FILENAME_TAGS, 'page=' . $HTTP_GET_VARS['page'] . '&sID=' . $sInfo->products_id . '&action=delete')));
        $contents[] = array('text' => '<br />'. MODULE_BOXES_TAG_PRODUCTS_DATE_ADDED .'&nbsp;'. tep_date_short($sInfo->products_date_added));
        $contents[] = array('align' => 'center', 'text' => '<br />' . tep_info_image($sInfo->products_image, $sInfo->products_name, SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT));
        $contents[] = array('text' => '<br />'. MODULE_BOXES_TAG_PRODUCTS_PRICE .'&nbsp;'. $currencies->format($sInfo->products_price));
        $contents[] = array('text' => '<br />'. MODULE_BOXES_TAG_TITLE .': <strong>' . $tags . '</strong>');
      }
      break;
  }
  if ( (tep_not_null($heading)) && (tep_not_null($contents)) ) {
    echo '            <td width="25%" valign="top">' . "\n";

    $box = new box;
    echo $box->infoBox($heading, $contents);

    echo '            </td>' . "\n";
  }
}
?>
          </tr>
        </table></td>
      </tr>
    </table>

<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
