<section class="footer__logo-container">
	<div class="container">
		{block name='hook_footer_before'}
		<img src="{$urls.img_url}logo-footer.svg" alt="Olympe logo en blanc">
		{/block}
	</div>
</section>

<section class="footer-container">
	<div class="container">
		<div class="first-links">
			{block name='hook_footer'}
							{hook h='displayFooter'}
						{/block}
		</div>
		<div class="second-links">
			{block name='hook_footer_after'}
							{hook h='displayFooterAfter'}
						{/block}
		</div>
	</section>
	<section class="mention">
		{block name='copyright_link'}
		<p>Réalisation:
			<a href="https://www.btg-communication.fr" target="_blank" rel="noopener referrer">btg communication</a>
		</p>
		{/block}
	</section>
</div>
