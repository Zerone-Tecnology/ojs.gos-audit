{**
 * templates/frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display NavigationMenuItem custom page content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

<div class="breadcrumb">
	<div class="container">
		<div class="row">
			{assign var=currentTitle value=$title}{include file="frontend/components/breadcrumbs.tpl"}
		</div>
	</div>
</div>

<main class="main_page">
	<div class="container">
		<div class="page-wrapper">
			<div class="title">
				{$title|escape}
			</div>
			<div class="page-content">
				{$content}
			</div>
		</div>
	</div>
</div>

{include file="frontend/components/footer.tpl"}
