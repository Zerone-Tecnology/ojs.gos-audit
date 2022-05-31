{**
 * templates/frontend/pages/userRegister.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * @uses $primaryLocale string The primary locale for this journal/press
 *}
{include file="frontend/components/header.tpl" pageTitle="user.register"}

<div class="breadcrumb">
	<div class="container">
		<div class="row">
			<nav class="cmp_breadcrumbs" role="navigation" aria-label="Вы здесь:">
				<ol>
					<li>
						<a href="/">
							{translate key="user.index"}
						</a>
					</li>
					<li class="current">
						<span aria-current="page">
							{translate key="user.register"}
						</span>
					</li>
				</ol>
			</nav>
		</div>
	</div>
</div>

<main class="main_page">
	<div class="container">
		<div class="page-wrapper">
			<div class="title">
				{translate key="user.register"}
			</div>
			<div class="page-content">

				<form class="form-register" id="register" method="post" action="{url op="register"}">
					{csrf}
					<input type="hidden" name="source" value="{$source|escape}" />

					{include file="common/formErrors.tpl"}

					{include file="frontend/components/registrationForm.tpl"}

					{include file="frontend/components/registrationFormContexts.tpl"}

					{* recaptcha spam blocker *}
					{if $reCaptchaHtml}
						<div class="form-group">
							{$reCaptchaHtml}
						</div>
					{/if}

					<div class="form-group form-group-buttons">
						<button class="btn btn-primary" type="submit">
							{translate key="user.register"}
						</button>
					</div>
					<div class="form-group form-group-login">
						{translate key="plugins.themes.healthSciences.register.haveAccount"}
						{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
						<a href="{url page="login" source=$rolesProfileUrl}" class="login">
							{translate key="plugins.themes.healthSciences.register.loginHere"}
						</a>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</main>
	<!-- .page -->

{include file="frontend/components/footer.tpl"}
