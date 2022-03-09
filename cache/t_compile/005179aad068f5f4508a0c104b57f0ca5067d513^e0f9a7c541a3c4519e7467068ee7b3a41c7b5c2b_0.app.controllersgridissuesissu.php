<?php
/* Smarty version 3.1.39, created on 2022-02-02 11:26:15
  from 'app:controllersgridissuesissu' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.39',
  'unifunc' => 'content_61fa15f769d5b3_57580841',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e0f9a7c541a3c4519e7467068ee7b3a41c7b5c2b' => 
    array (
      0 => 'app:controllersgridissuesissu',
      1 => 1630422126,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_61fa15f769d5b3_57580841 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
 type="text/javascript">
	// Attach the JS file tab handler.
	$(function() {
		$('#editIssueTabs').pkpHandler('$.pkp.controllers.TabHandler');
	});
<?php echo '</script'; ?>
>
<div id="editIssueTabs">
	<ul>
		<li><a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'op'=>"issueToc",'issueId'=>$_smarty_tpl->tpl_vars['issueId']->value),$_smarty_tpl ) );?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"issue.toc"),$_smarty_tpl ) );?>
</a></li>
		<li><a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'op'=>"editIssueData",'issueId'=>$_smarty_tpl->tpl_vars['issueId']->value),$_smarty_tpl ) );?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"editor.issues.issueData"),$_smarty_tpl ) );?>
</a></li>
		<li><a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'op'=>"issueGalleys",'issueId'=>$_smarty_tpl->tpl_vars['issueId']->value),$_smarty_tpl ) );?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"editor.issues.galleys"),$_smarty_tpl ) );?>
</a></li>
		<?php if ($_smarty_tpl->tpl_vars['enableIdentifiers']->value) {?>
			<li id="identifiersTab"><a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'op'=>"identifiers",'issueId'=>$_smarty_tpl->tpl_vars['issueId']->value),$_smarty_tpl ) );?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"editor.issues.identifiers"),$_smarty_tpl ) );?>
</a></li>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['currentJournal']->value->getData('publishingMode') == PUBLISHING_MODE_SUBSCRIPTION) {?>
			<li><a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'op'=>"access",'issueId'=>$_smarty_tpl->tpl_vars['issueId']->value),$_smarty_tpl ) );?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"editor.issues.access"),$_smarty_tpl ) );?>
</a></li>
		<?php }?>
	</ul>
</div>
<?php }
}
