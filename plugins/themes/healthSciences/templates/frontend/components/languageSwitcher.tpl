{**
 * templates/frontend/components/languageSwitcher.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief A re-usable template for displaying a language switcher dropdown.
 *
 * @uses $currentLocale string Locale key for the locale being displayed
 * @uses $languageToggleLocales array All supported locales
 * @uses $id string A unique ID for this language toggle
 *}
{if $languageToggleLocales && $languageToggleLocales|@count > 1}
	<ul class="lang--list">
		<li class="lang--item active">
			<a class="part-2 current lang--link" type="button" id="languageToggleMenu{$id|escape}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="sr-only">{translate key="plugins.themes.healthSciences.language.toggle"}</span>
				{$languageToggleLocales[$currentLocale]}
			</a>
		</li>
		
			{foreach from=$languageToggleLocales item="localeName" key="localeKey"}
				{if $localeKey !== $currentLocale}
					<li class="lang--item">
						<a class="part-2 lang--link" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
							{$localeName}
						</a>
					</li>
				{/if}
			{/foreach}
	</ul>
{/if}