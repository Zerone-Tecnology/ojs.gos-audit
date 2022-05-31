{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="announcement.announcements"}

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
							{translate key="user.announcements"}
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
				{translate key="user.announcements"}
			</div>
			<div class="page-content">
				{$announcementsIntroduction|strip_unsafe_html}
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="announcements" anchor="announcements" sectionTitleKey="announcement.announcements"}
				{foreach from=$announcements item=announcement}
						{include file="frontend/objects/announcement_summary.tpl"}
				{/foreach}
			</div>
		</div>
	</div>
</main>

{include file="frontend/components/footer.tpl"}
