{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

{if $homepageImage}
	<div class="homepage-image{if $issue} homepage-image-behind-issue{/if}">
		<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
	</div>
{/if}

<div class="container container-homepage-issue page-content">
	{if $issue}
		<!-- Main banner -->
		<section class="banner--wide-top row">
			<!-- <img class="fly" src="{$baseUrl}/templates/images/banner/circles.svg" alt="" /> -->
			<article>
				<div class="cartegory">
					{translate key="mainpage.banner.section"}
				</div>
				<div class="title">
					{$homepageImage.altText|escape}
				</div>
				<div class="description">
					{if $additionalHomeContent}
						{$additionalHomeContent}
					{/if}
				</div>
				<div class="btn--wrapper">
					<div class="btn--inline">
						<a href="/index.php/ma/submission/wizard" class="btn btn--primary">
							{translate key="navigation.sendarticle"}
						</a>
						<a href="/index.php/ma/issue/current" class="btn btn--secondary">
							{translate key="plugins.readlast"}
						</a>
					</div>
				</div>
			</article>
		</section>

	{/if}

	{* display announcements before full issue *}
	{if $numAnnouncementsHomepage && $announcements|@count}
	<section class="row homepage-announcements content--complex"">



		<div class="content--left">
			<div class="block">
				<div class="block--title">
					<div class="title">
						<h3>
							{translate key="mainpage.latestEvents"}
						</h3>
					</div>
					<div class="link">
						<a href="/index.php/ma/announcement" class="block--link">
							{translate key="mainpage.latestEventsAll"}
						</a>
					</div>
				</div>
				<div class="block--content">
					<div class="news--list">
						{foreach from=$announcements item=announcement}
							<div class="news--item">
								<div class="news--content--wrapper">
									<div class="news--content">
										<div class="news--image">
											{$announcement->getLocalizedImage()}
										</div>
										<article class="news--info">
											<div class="title">
												<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
													{$announcement->getLocalizedTitle()|escape}
												</a>
											</div>
										</article>
									</div>
								</div>
							</div>
						{/foreach}

						<div class="pagination pagination--news">
							<div class="icon icon--arrow-left">
								<a href="/">
									<img
										src="{$baseUrl}/templates/images/icons/arrow-left.svg"
										alt=""
										srcset=""
									/>
								</a>
							</div>
							<div class="icon icon--arrow-right">
								<a href="/">
									<img
										src="{$baseUrl}/templates/images/icons/arrow-right.svg"
										alt=""
										srcset=""
									/>
								</a>
							</div>
							<div class="external">
								<div class="image--wrapper">
									<a href="/" class="icon icon--circle active"></a>
									<a href="/" class="icon icon--circle"></a>
									<a href="/" class="icon icon--circle"></a>
								</div>
							</div>
						</div>

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
						
					</div>
				</div>
			</div>
		</div>
		<div class="content--right">
					<div class="block">
						<div class="block--title">
							<div class="title">
								<h3>{translate key="mainpage.useful.links"}</h3>
							</div>
						</div>
						<div class="block--content">
							 {call_hook name="Templates::Common::Sidebar"}
						</div>
					</div>
				</div>

	</section>
	{/if}

	{if $issue}
		<div class="row issue-wrapper{if $homepageImage && $issue->hasDescription()} issue-full-data{elseif $homepageImage && $issue->getLocalizedCoverImageUrl()} issue-image-cover{elseif $homepageImage} issue-only-image{/if}">
			<div class="col-12 col-lg-9">
				{include file="frontend/objects/issue_toc.tpl" sectionHeading="h3"}
			</div>
		</div>
	{/if}

</div><!-- .container -->

{include file="frontend/components/footer.tpl"}
