{block name='product_miniature_item'}
	<div class="js-product product{if !empty($productClasses)} {$productClasses}{/if}">
		<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}"
			data-id-product-attribute="{$product.id_product_attribute}">
			<div class="thumbnail-container">
				<div class="border-product">
					<div class="thumbnail-top">
						{block name='product_thumbnail'}
							{if $product.cover}
								<a href="{$product.url}" class="thumbnail product-thumbnail">
									<img src="{$product.cover.bySize.home_default.url}"
										alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
										loading="lazy" data-full-size-image-url="{$product.cover.large.url}"
										width="{$product.cover.bySize.home_default.width}"
										height="{$product.cover.bySize.home_default.height}" />
								</a>
							{else}
								<a href="{$product.url}" class="thumbnail product-thumbnail">
									<img src="{$urls.no_picture_image.bySize.home_default.url}" loading="lazy"
										width="{$urls.no_picture_image.bySize.home_default.width}"
										height="{$urls.no_picture_image.bySize.home_default.height}" />
								</a>
							{/if}
						{/block}
						{include file='catalog/_partials/product-flags.tpl'}
						<form action="{$urls.pages.cart}" method="post" class="custom-add-to-cart">
							<input type="hidden" name="token" value="{$static_token}">
							<input type="hidden" name="id_product" value="{$product.id}" class="product_page_product_id">
							<input type="hidden" name="qty" value="1">
							<button class="btn-add-to-cart-custom" data-button-action="add-to-cart" type="submit"
								{if $product.quantity < 1 }disabled{/if}>
								<img src="{$urls.img_url}add-to-cart.svg" alt="Ajouter au panier">
								<span class="screen-reader-text">Ajouter "{$product.name}" au panier</span>
							</button>
						</form>
					</div>

					<div class="product-description">
						{block name='product_name'}
							{if $page.page_name == 'index'}
								<h3 class="h3 product-title">
									<a href="{$product.url}" content="{$product.url}">{$product.name|truncate:40:'...'}</a>
								</h3>
							{else}
								<h2 class="h3 product-title">
									<a href="{$product.url}" content="{$product.url}">{$product.name|truncate:40:'...'}</a>
								</h2>
							{/if}
						{/block}
					</div>
				</div>

				<div class="bottom-product">
					{block name='product_price_and_shipping'}
						{if $product.show_price}
							<div class="product-price-and-shipping">
								{if $product.has_discount}
									{hook h='displayProductPriceBlock' product=$product type="old_price"}

									<span class="regular-price"
										aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
									{if $product.discount_type === 'percentage'}
										<span class="discount-percentage discount-product">{$product.discount_percentage}</span>
									{elseif $product.discount_type === 'amount'}
										<span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
									{/if}
								{/if}

								{hook h='displayProductPriceBlock' product=$product type="before_price"}

								<span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
									{capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
									{if '' !== $smarty.capture.custom_price}
										{$smarty.capture.custom_price nofilter}
									{else}
										{$product.price}
									{/if}
								</span>

								{hook h='displayProductPriceBlock' product=$product type='unit_price'}

								{hook h='displayProductPriceBlock' product=$product type='weight'}
							</div>
						{/if}
					{/block}
				</div>

				{block name='product_reviews'}
					{hook h='displayProductListReviews' product=$product}
				{/block}

			</div>
		</article>
	</div>
{/block}