{if $product.images}
    <div class="minicart-img">
        <img src="{$product.images.0.bySize.small_default.url}" title="{$product.name}" />
    </div>
{/if}
<div class="product-left">
    <h4>{$product.name}</h4>
    <p class="mini-cart__qtt">x{$product.quantity}</p>
    <p class="mini-cart__price">{$product.price}</p>
    <a class="remove-from-cart" rel="nofollow" href="{$product.remove_from_cart_url}"
        data-link-action="remove-from-cart" title="{l s='remove from cart' d='Shop.Theme.Actions'}">
        Supprimer
    </a>
</div>

{if $product.customizations|count}
    <div class="customizations">
        <ul>
            {foreach from=$product.customizations item='customization'}
                <li>
                    <span class="product-quantity">{$customization.quantity}</span>
                    <a href="{$customization.remove_from_cart_url}" title="{l s='remove from cart' d='Shop.Theme.Actions'}"
                        class="remove-from-cart" rel="nofollow">{l s='Remove' d='Shop.Theme.Actions'}</a>
                    <ul>
                        {foreach from=$customization.fields item='field'}
                            <li>
                                <span>{$field.label}</span>
                                {if $field.type == 'text'}
                                    <span>{$field.text nofilter}</span>
                                {elseif $field.type == 'image'}
                                    <img src="{$field.image.small.url}" loading="lazy">
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}