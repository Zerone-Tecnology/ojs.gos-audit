{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

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
							{translate key="user.login"}
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
				{translate key="user.login"}
			</div>
			<div class="page-content">

				{* A login message may be displayed if the user was redireceted to the
				login page from another request. Examples include if login is required
				before dowloading a file. *}
				{if $loginMessage}
					<p>
						{translate key=$loginMessage}
					</p>
				{/if}

				{if $error}
					<div class="alert alert-danger" role="alert">
						{translate key=$error reason=$reason}
					</div>
				{/if}

				{include file="frontend/components/loginForm.tpl" formType = "loginPage"}

			</div>
		</div>
	</div>
</main>
{include file="frontend/components/footer.tpl"}
