<div id="_desktop_user_info">
	<div class="user-info">
		{if $logged}
		<a class="account" href="{$urls.pages.my_account}" title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
			<img src="{$urls.img_url}account-connected.svg" alt="Déconnectez-vous">
			<span class="screen-reader-text">Bonjour {$customerName}, vous pouvez accéder à votre compte en cliquant sur l'image ci-dessus ou sur ce texte</span>
		</a>
		{else}
		<a href="{$urls.pages.my_account}" title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
			<img src="{$urls.img_url}account.svg" alt="Connectez-vous">
			<span class="screen-reader-text">Connectez-vous</span>
		</a>
		{/if}
	</div>
</div>
