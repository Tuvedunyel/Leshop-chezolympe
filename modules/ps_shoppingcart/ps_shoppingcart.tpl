<div id="_desktop_cart">
	<div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
		<div class="cart-container">
			<a class="cart-link" rel="nofollow" aria-label="{l s='Shopping cart link containing %nbProducts% product(s)' sprintf=['%nbProducts%' => $cart.products_count] d='Shop.Theme.Checkout'}" href="{$cart_url}">
				<img src="{$urls.img_url}cart.svg" alt="Mon panier">
				{if $cart.product_count > 0}
				<span class="cart-products-count">{$cart.products_count}</span>
				{/if}
			</a>
		</div>
	</div>
</div>
