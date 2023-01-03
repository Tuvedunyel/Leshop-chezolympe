{block name='brand_miniature_item'}
    <li class="brand">
        <div class="brand-infos">
            <a href="{$brand.url}">{$brand.name}</a>
            {$brand.text nofilter}
        </div>
        <div class="brand-products">
            <a href="{$brand.url}">{$brand.nb_products}</a>
            <a href="{$brand.url}">{l s='View products' d='Shop.Theme.Actions'}</a>
        </div>
    </li>
{/block}