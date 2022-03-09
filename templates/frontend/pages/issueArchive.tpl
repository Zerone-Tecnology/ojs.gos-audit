{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
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

{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}
		
<div class="page page_issue_archive">
	{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}
	<h1>
		{$pageTitle|escape}
	</h1>

	{* No issues have been published *}
	{if empty($issues)}
		<p>{translate key="current.noCurrentIssueDesc"}</p>

		

	{* List issues *}
	{else}
<ul class="issues_archive" id="List">
<div class="begin_row">
            {foreach from=$issues item="issue"}
                {if $issue->getYear() != $lastYear}
</div>
                          <div class="year-pkp"><h3>{$issue->getYear()|escape}</h3></div>
                      {assign var=lastYear value=$issue->getYear()}
<div class="begin_row">
                  {/if}
                <li>
                    {include file="frontend/objects/issue_summary.tpl"}
                </li>
            {/foreach}
</div">
        </ul>

		

		{* Pagination *}
		{if $prevPage > 1}
			{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}{/capture}
		{elseif $prevPage === 1}
			{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}{/capture}
		{/if}
		{if $nextPage}
			{capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}{/capture}
		{/if}
		{include
			file="frontend/components/pagination.tpl"
			prevUrl=$prevUrl
			nextUrl=$nextUrl
			showingStart=$showingStart
			showingEnd=$showingEnd
			total=$total
		}
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
