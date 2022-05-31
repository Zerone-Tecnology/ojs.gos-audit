{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

		<footer>
			<div class="container">
				<div class="footer--left">
					<div class="contact--info">
						{if $pageFooter}
							<div class="pkp_footer_content">
								{$pageFooter}
							</div>
						{/if}
					</div>
				</div>
				<div class="footer--right">
					<div class="subscribe--wrapper">

						<div action="" method="get" class="subscribe--from">
							<div class="subscribe--contacts">
								<a href="#" class="subscribe--contact" type="submit"><img class="personal--svg" src="{$baseUrl}/templates/images/icons/icon-social-whatsapp.svg" /></a>
								<a href="#" class="subscribe--contact" type="submit"><img class="personal--svg" src="{$baseUrl}/templates/images/icons/icon-social-instagram.svg" /></a>
								<a href="#" class="subscribe--contact" type="submit"><img class="personal--svg" src="{$baseUrl}/templates/images/icons/icon-social-facebook.svg" /></a>
							</div>

							<form id="loginform" action="" class="subscribe--email" method="post">
								<input class="subscribe--input" type="email" name="email" placeholder="Email" required/>
								<input class="subscribe--btn" type="submit" value="{translate key="btn.subscribe"}" />
							</form>
				
						</div>
					</div>
				</div>
				<div class="footer--bottom">
					<div class="site--info-c">
						{translate key="footer.copyrightText"}
					</div>
					<div class="site--info-dev">
						<a href="" target="_blank">{translate key="footer.websiteDevelopment"} — Zerone Technology</a>
					</div>
					<img class="dev--svg" src="{$baseUrl}/templates/images/icons/logo-zerone.svg" />
					
				</div>
			</div>
		</footer>

		<style>
			form.warning .subscribe--input {
				border: 1px solid red;
			}
		</style>

<!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}
<script src="{$baseUrl}\plugins/themes/healthSciences\js/custom.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#loginform').submit(function(e) {
		e.preventDefault();
	    if( !$('.subscribe--input').val() ) {
			$('#loginform').addClass('warning');

		} else {
			$('#loginform').removeClass('warning');

			$.ajax({
				type: "POST",
				url: '{$baseUrl}/index.php/ma/api/v1/subscribe/',
				data: $(this).serialize(),
				success: function(response)
				{
					var jsonData = JSON.parse(response);
					console.log(jsonData);
					// user is logged in successfully in the back-end
					// let's redirect
					if (jsonData.message == "subscribed")
					{
						$('.subscribe--input').val('');
						alert("Ваша почта отправлено успешно!!!")
					}
					else
					{
						alert('Invalid Credentials!');
					}
			}
			});
		}
     });
});
</script>


{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
