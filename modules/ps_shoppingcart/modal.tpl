<div id="blockcart-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                    aria-label="{l s='Close' d='Shop.Theme.Global'}">
                    <span aria-hidden="true"><i class="material-icons">close</i></span>
                </button>
            </div>
            <div class="modal-body">
                <div class="modal-body__container">
                    <div class="product-part">
                        <div class="product-part__container">
                            <div class="thumbnail__container">
                                {if $product.default_image}
                                    <img src="{$product.default_image.medium.url}"
                                        data-full-size-image-url="{$product.default_image.large.url}"
                                        title="{$product.default_image.legend}" alt="{$product.default_image.legend}"
                                        loading="lazy" class="product-image">
                                {else}
                                    <img src="{$urls.no_picture_image.bySize.medium_default.url}" loading="lazy"
                                        class="product-image" />
                                {/if}
                            </div>
                            <div class="content__container">
                                <h4>Vous avez ajouté à votre panier :</h4>
                                <span class="product-quantity">x
                                    <strong>{$product.cart_quantity}</strong>
                                </span>
                                <h6 class="h6 product-name">{$product.name}</h6>
                                {if $product.has_discount}
                                    <div class="product-price__container">
                                        <div class="product-discount">
                                            {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                            <span class="regular-price">{$product.regular_price}</span>
                                        </div>
                                        <div class="current-product-price">
                                            <strong>{$product.price}</strong>
                                        </div>
                                    </div>
                                {else}
                                    <p class="product-price">{$product.price}</p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="more-infos-modal">
                        <div class="cart-content">
                            {if $cart.products_count > 1}
                                <p class="cart-products-count">
                                    {l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}
                                </p>
                            {else}
                                <p class="cart-products-count">
                                    {l s='There is %products_count% item in your cart.' sprintf=['%products_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}
                                </p>
                            {/if}
                            <p><span class="label">{l s='Subtotal:' d='Shop.Theme.Checkout'}</span>&nbsp;<span
                                    class="subtotal value">{$cart.subtotals.products.value}</span></p>
                            {if $cart.subtotals.shipping.value}
                                <p><span>Livraison :</span>&nbsp;<span
                                        class="shipping value">{$cart.subtotals.shipping.value}
                                        {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</span>
                                </p>
                            {/if}

                            {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
                                <p><span>Total :</span>&nbsp;<span>{$cart.totals.total.value}</span>
                                </p>
                                <p class="product-total"><span
                                        class="label">{$cart.totals.total_including_tax.label}</span>&nbsp;<span
                                        class="value">{$cart.totals.total_including_tax.value}</span></p>
                            {else}
                                <p class="product-total"><span class="label">Total :</span>&nbsp;<span
                                        class="value">{$cart.totals.total.value}</span></p>
                            {/if}

                            {if $cart.subtotals.tax}
                                <p class="product-tax">
                                    {l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}&nbsp;<span
                                        class="value">{$cart.subtotals.tax.value}</span></p>
                            {/if}
                            {hook h='displayCartModalContent' product=$product}
                            <div class="cart-content-btn">
                                <button id="modal-btn" type="button" class="btn btn-secondary"
                                    data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
                                <a href="{$cart_url}" id="modal-link"
                                    class="btn btn-primary">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {hook h='displayCartModalFooter' product=$product}
        </div>
    </div>
</div>