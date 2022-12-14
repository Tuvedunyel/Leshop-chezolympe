<div class="product-line-grid custom__product-line-grid">
    <!--  product line left content: image-->
    <div class="product-line-grid-left">
        <span class="product-image media-middle">
            {if $product.default_image}
                <img src="{$product.default_image.bySize.medium_default.url}" alt="{$product.name|escape:'quotes'}"
                    loading="lazy">
            {else}
                <img src="{$urls.no_picture_image.bySize.cart_default.url}" loading="lazy" />
            {/if}
        </span>
        <div class="autre-container">
            <a class="label product-title-a" href="{$product.url}"
                data-id_customization="{$product.id_customization|intval}">{$product.name}
            </a>

            {foreach from=$product.attributes key="attribute" item="value"}
                <div class="product-line-info custom__product-line-info {$attribute|lower}">
                    <span class="label">{$attribute} :</span>
                    <span class="value">{$value}</span>
                </div>
            {/foreach}
        </div>
    </div>

    <div class="product-line-info custom__product-title">
        <div class="remove-from-cart__container">
            <div class="cart-line-product-actions">
                <a class="remove-from-cart" rel="nofollow" href="{$product.remove_from_cart_url}"
                    data-link-action="delete-from-cart" data-id-product="{$product.id_product|escape:'javascript'}"
                    data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
                    data-id-customization="{$product.id_customization|escape:'javascript'}">
                    {if empty($product.is_gift)}
                        <i class="material-icons float-xs-left">delete</i>
                    {/if}
                </a>

                {block name='hook_cart_extra_product_actions'}
                    {hook h='displayCartExtraProductActions' product=$product}
                {/block}

            </div>
        </div>
    </div>

    <div class="product-line-info product-price h5 {if $product.has_discount}has-discount{/if}">
        <div class="current-price">
            {if $product.has_discount}
                <span class="regular-price">{$product.regular_price}</span>
            {/if}
            <span class="price">{$product.price}</span>
            {if $product.unit_price_full}
                <div class="unit-price-cart">{$product.unit_price_full}</div>
            {/if}
        </div>
        {hook h='displayProductPriceBlock' product=$product type="unit_price"}
    </div>

    {if is_array($product.customizations) && $product.customizations|count}
        <br>
        {block name='cart_detailed_product_line_customization'}
            {foreach from=$product.customizations item="customization"}
                <a href="#" data-toggle="modal"
                    data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}"
                    tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-label="{l s='Close' d='Shop.Theme.Global'}">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                            </div>
                            <div class="modal-body">
                                {foreach from=$customization.fields item="field"}
                                    <div class="product-customization-line row">
                                        <div class="label">
                                            {$field.label}
                                        </div>
                                        <div class="value">
                                            {if $field.type == 'text'}
                                                {if (int)$field.id_module}
                                                    {$field.text nofilter}
                                                {else}
                                                    {$field.text}
                                                {/if}
                                            {elseif $field.type == 'image'}
                                                <img src="{$field.image.small.url}" loading="lazy">
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        {/block}
    {/if}

    <div class="product-line-grid-right product-line-actions">
        <div class="custom__qty-container">
            <div class="hidden-md-up"></div>
            <div class="custom__qty-part">
                <div class="custom__qty-wrapper">
                    <div class="qty">
                        {if !empty($product.is_gift)}
                            <span class="gift-quantity">{$product.quantity}</span>
                        {else}
                            <input id="cart-product-qty" class="js-cart-line-product-quantity"
                                data-down-url="{$product.down_quantity_url}" data-up-url="{$product.up_quantity_url}"
                                data-update-url="{$product.update_quantity_url}" data-product-id="{$product.id_product}"
                                type="number" inputmode="numeric" pattern="[0-9]*" value="{$product.quantity}"
                                name="product-quantity-spin"
                                aria-label="{l s='%productName% product quantity field' sprintf=['%productName%' => $product.name] d='Shop.Theme.Checkout'}" />
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="product-total__custom">
        <div class="price">
            <span class="product-price">
                <strong>
                    {if !empty($product.is_gift)}
                        <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
                    {else}
                        {$product.total}
                    {/if}
                </strong>
            </span>
        </div>
    </div>

    <div class="clearfix"></div>
</div>