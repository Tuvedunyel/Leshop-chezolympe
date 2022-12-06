<div id="_desktop_cart">
	<div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}"
		data-refresh-url="{$refresh_url}">
		<div class="cart-container">
			<a class="cart-link" rel="nofollow"
				aria-label="{l s='Shopping cart link containing %nbProducts% product(s)' sprintf=['%nbProducts%' => $cart.products_count] d='Shop.Theme.Checkout'}"
				href="{$cart_url}">
				<img src="{$urls.img_url}cart.svg" alt="Mon panier">
				{if $cart.product_count > 0}
					<span class="cart-products-count">{$cart.products_count}</span>
				{/if}
			</a>
		</div>
	</div>
</div>
{if $cart.products_count > 0}
	<div class="ht_cart cart-hover-content">
		<ul>
			{foreach from=$cart.products item=product}
				<li class="cart-wishlist-item">
					{include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}
				</li>
			{/foreach}
		</ul>
		<div class="cart-summary">
			<div class="cart-subtotals">
				{foreach from=$cart.subtotals item="subtotal"}
					<div class="{$subtotal.type}">
						<span class="label">{$subtotal.label}</span>
						<span class="value">{$subtotal.value}</span>
					</div>
				{/foreach}
			</div>
			<div class="cart-total">
				<span class="label">{$cart.totals.total.label}</span>
				<span class="value">{$cart.totals.total.value}</span>
			</div>
		</div>
		<div class="cart-wishlist-action">
			<a class="cart-wishlist-viewcart" href="{$cart_url}">Voir le panier</a>
			<a class="cart-wishlist-checkout" href="{$urls.pages.order}">Commander</a>
		</div>
	</div>
{else}
	<div class="ht_cart cart-hover-content">
		<p class="no-item">Votre panier est actuellement vide</p>
	</div>
{/if}