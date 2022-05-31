{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

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
							{translate key="user.archive"}
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
				{translate key="user.archive"}
			</div>
			<div class="page-content">
				{* No issues have been published *}
				{if empty($issues)}
					<div class="page-header page-issue-header">
						{include file="frontend/components/notification.tpl" messageKey="current.noCurrentIssueDesc"}
					</div>

				{* List issues *}
				{else}
                   
					<div class="archive-form-block">
						<form action="" class="form-filter">
							<ul class="x-nav select-year" data-x-element="tab_nav" data-x-params="orientation-vertical">
								{foreach from=$issues item="issue" key="x"}
									{if $issue->getYear() != $lastYear}
										{if $x == 0}
											<li  data-tab-target="#{$issue->getYear()|escape}"  class="x-nav-tabs-item active">
												<a data-cs-tab-toggle="{$issue->getYear()|escape}">{$issue->getYear()|escape}</a>
											</li>
											<div class="circle"></div>
											{assign var=lastYear value=$issue->getYear()}
										{else}
											<li  data-tab-target="#{$issue->getYear()|escape}"  class="x-nav-tabs-item">
												<a data-cs-tab-toggle="{$issue->getYear()|escape}">{$issue->getYear()|escape}</a>
											</li>
											<div class="circle"></div>
											{assign var=lastYear value=$issue->getYear()}
										{/if}
									{/if} 
									
								{/foreach}
							</ul>
						</form>
					</div>
						

					{foreach from=$issues item="issue" key="i"}
						{if $issue->getYear() != $lastYear && $i > 0}
							</div>
						{/if}
						{if $i == 0}
								<div class="row justify-content-center x-tab-pane active" data-cs-tab-index="{$issue->getYear()|escape}">
								{assign var=lastYear value=$issue->getYear()}
						{elseif $issue->getYear() != $lastYear}
							<div class="row justify-content-center x-tab-pane" data-cs-tab-index="{$issue->getYear()|escape}">
							{assign var=lastYear value=$issue->getYear()}
						{/if}
						<div class="col-md-3 col-lg-3">
							{include file="frontend/objects/issue_summary.tpl" heading="h2"}
						</div>

					{/foreach}
					{if $lastYear}
						</div>{* Close an open row *}
					{/if}

					
				{/if}
			</div>
		</div>
	</div>
</main>


{include file="frontend/components/footer.tpl"}
