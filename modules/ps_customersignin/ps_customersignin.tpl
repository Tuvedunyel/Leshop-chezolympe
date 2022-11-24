<div id="_desktop_user_info">
	<div class="user-info">
		{if $logged}
		<a class="logout hidden-sm-down" href="{$urls.actions.logout}" rel="nofollow">
			<i class="material-icons">&#xE7FF;</i>
			{l s='Sign out' d='Shop.Theme.Actions'}
		</a>
		<a class="account" href="{$urls.pages.my_account}" title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
			<i class="material-icons hidden-md-up logged">&#xE7FF;</i>
			<span class="hidden-sm-down">{$customerName}</span>
		</a>
		{else}
		<a href="{$urls.pages.my_account}" title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
			<img src="{$urls.img_url}account.svg" alt="Connectez-vous">
			<span class="screen-reader-text">Connectez-vous</span>
		</a>
		{/if}
	</div>
</div>
