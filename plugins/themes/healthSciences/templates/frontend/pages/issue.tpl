{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueGalleys array Galleys for the entire issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

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
							{translate key="page.issue"}
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
				{translate key="page.issue"}
			</div>
			<div class="page-content">
				{$issue->getLocalizedDescription()|strip_unsafe_html}
				{if $issueGalleys}
					<div class="page-issue-galleys">
						<div class="h3">
							{translate key="issue.fullIssue"}:
						</div>
						{foreach from=$issueGalleys item=galley}
							{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
						{/foreach}
					</div>
				{/if}

				{* Display a message if no current issue exists *}
				{if !$issue}
					<div class="page-header page-issue-header">
						{include file="frontend/components/notification.tpl" messageKey="current.noCurrentIssueDesc"}
					</div>

				{* Display an issue with the Table of Contents *}
				{else}

					

					<div class="row{if !$issue->getLocalizedDescription() || !$issue->getLocalizedCoverImageUrl()} issue-wrapper{/if}">
						<div class="col-12 col-lg-9">
							{include file="frontend/objects/issue_toc.tpl" sectionHeading="h2"}
						</div>
					</div>
				{/if}
			</div>
		</div>
	</div>
</main>

{include file="frontend/components/footer.tpl"}
