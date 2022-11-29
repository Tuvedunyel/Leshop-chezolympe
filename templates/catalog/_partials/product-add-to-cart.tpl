<div class="product-add-to-cart js-product-add-to-cart">
    {if !$configuration.is_catalog}
        <span class="control-label taille-texte">Quantité :<span>

                {block name='product_quantity'}
                    <div class="product-quantity clearfix custom__product-quantity">
                        <div class="qty custom__qty">
                            <div id="minus" class="quantity-controller">
                                <span>-</span>
                            </div>
                            <input type="number" name="qty" id="quantity_wanted" inputmode="numeric" pattern="[0-9]*"
                                {if $product.quantity_wanted} value="{$product.quantity_wanted}"
                                min="{$product.minimal_quantity}" {else} value="1" min="1" 
                                {/if} class="input-group"
                                aria-label="{l s='Quantity' d='Shop.Theme.Actions'}">
                            <div id="plus" class="quantity-controller"><span>+</span></div>
                        </div>

                        <div class="add">
                            <button class="btn btn-primary add-to-cart" data-button-action="add-to-cart" type="submit"
                                {if !$product.add_to_cart_url} disabled {/if}>
                                {l s='Add to cart' d='Shop.Theme.Actions'}
                            </button>
                        </div>

                    </div>
                {/block}

                {block name='product_availability'}
                    <span id="product-availability" class="js-product-availability">
                        {if $product.show_availability && $product.availability_message}
                            {if $product.availability == 'available'}
                                <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
                            {elseif $product.availability == 'last_remaining_items'}
                                <i class="material-icons product-last-items">&#xE002;</i>
                            {else}
                                <i class="material-icons product-unavailable">&#xE14B;</i>
                            {/if}
                            {$product.availability_message}
                        {/if}
                    </span>
                {/block}

                {block name='product_minimal_quantity'}
                    <p class="product-minimal-quantity js-product-minimal-quantity">
                        {if $product.minimal_quantity > 1}
                            {l
                                                                                                                                                                                                                                             s='The minimum purchase order quantity for the product is %quantity%.'
                                                                                                                                                                                                                                             d='Shop.Theme.Checkout'
                                                                                                                                                                                                                                             sprintf=['%quantity%' => $product.minimal_quantity]
                                                                                                                                                                                                                                             }
                        {/if}
                    </p>
                {/block}
            {/if}
</div>