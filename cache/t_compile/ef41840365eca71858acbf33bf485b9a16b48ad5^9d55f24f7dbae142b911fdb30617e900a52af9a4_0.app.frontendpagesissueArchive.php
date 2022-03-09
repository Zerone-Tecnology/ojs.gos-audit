<?php
/* Smarty version 3.1.39, created on 2022-02-02 12:30:40
  from 'app:frontendpagesissueArchive' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.39',
  'unifunc' => 'content_61fa2510069967_58248314',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9d55f24f7dbae142b911fdb30617e900a52af9a4' => 
    array (
      0 => 'app:frontendpagesissueArchive',
      1 => 1643783437,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/breadcrumbs.tpl' => 1,
    'app:frontend/objects/issue_summary.tpl' => 1,
    'app:frontend/components/pagination.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_61fa2510069967_58248314 (Smarty_Internal_Template $_smarty_tpl) {
?>
 <style> 
 	.begin_row {
 	display: flex;
    flex-direction: row-reverse;
    float: left;
    width: 100%;
    justify-content: flex-end;
    flex-wrap: wrap;
    }
 	.obj_issue_summary .cover img {
 	max-height:150px!important;
 	    
 	}
 	.obj_issue_summary{
 		width: 215px!important;
 	}
	.year-pkp{
		display:block!important;
		padding: unset!important;
	    border-bottom: unset!important;
	} 
	.series{
		padding-right: 35px;
		width:200px;

	}

	@media only screen and (max-width: 767px) {
		.begin_row {
    justify-content: center;
        flex-direction: column-reverse;
    }
    .obj_issue_summary{
 		width: unset!important;
 	}
 	.obj_issue_summary .cover img{
 		max-height: 220px!important;
 	}
	}
	.year-pkp h3:first-child{
		margin-top:20px;
	}

</style>

<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "pageTitle", null);?>
	<?php if ($_smarty_tpl->tpl_vars['prevPage']->value) {?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"archive.archivesPageNumber",'pageNumber'=>$_smarty_tpl->tpl_vars['prevPage']->value+1),$_smarty_tpl ) );?>

	<?php } else { ?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"archive.archives"),$_smarty_tpl ) );?>

	<?php }
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitleTranslated'=>$_smarty_tpl->tpl_vars['pageTitle']->value), 0, false);
?>
		
<div class="page page_issue_archive">
	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitle'=>$_smarty_tpl->tpl_vars['pageTitle']->value), 0, false);
?>
	<h1>
		<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['pageTitle']->value ));?>

	</h1>

		<?php if (empty($_smarty_tpl->tpl_vars['issues']->value)) {?>
		<p><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"current.noCurrentIssueDesc"),$_smarty_tpl ) );?>
</p>

		

		<?php } else { ?>
<ul class="issues_archive" id="List">
<div class="begin_row">
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['issues']->value, 'issue');
$_smarty_tpl->tpl_vars['issue']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['issue']->value) {
$_smarty_tpl->tpl_vars['issue']->do_else = false;
?>
                <?php if ($_smarty_tpl->tpl_vars['issue']->value->getYear() != $_smarty_tpl->tpl_vars['lastYear']->value) {?>
</div>
                          <div class="year-pkp"><h3><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['issue']->value->getYear() ));?>
</h3></div>
                      <?php $_smarty_tpl->_assignInScope('lastYear', $_smarty_tpl->tpl_vars['issue']->value->getYear());?>
<div class="begin_row">
                  <?php }?>
                <li>
                    <?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/issue_summary.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
                </li>
            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
</div">
        </ul>

		

				<?php if ($_smarty_tpl->tpl_vars['prevPage']->value > 1) {?>
			<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'prevUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"issue",'op'=>"archive",'path'=>$_smarty_tpl->tpl_vars['prevPage']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
		<?php } elseif ($_smarty_tpl->tpl_vars['prevPage']->value === 1) {?>
			<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'prevUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"issue",'op'=>"archive"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['nextPage']->value) {?>
			<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'nextUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"issue",'op'=>"archive",'path'=>$_smarty_tpl->tpl_vars['nextPage']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
		<?php }?>
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/pagination.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('prevUrl'=>$_smarty_tpl->tpl_vars['prevUrl']->value,'nextUrl'=>$_smarty_tpl->tpl_vars['nextUrl']->value,'showingStart'=>$_smarty_tpl->tpl_vars['showingStart']->value,'showingEnd'=>$_smarty_tpl->tpl_vars['showingEnd']->value,'total'=>$_smarty_tpl->tpl_vars['total']->value), 0, false);
?>
	<?php }?>
</div>

<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
