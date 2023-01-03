{extends file=$layout}

{block name='content'}
    <section id="main" class="brands">

        {block name='brand_header'}
            <h1>{l s='Brands' d='Shop.Theme.Catalog'}</h1>
        {/block}

        {block name='brand_miniature'}
            <ul class="brand-miniature__custom">
                {foreach from=$brands item=brand}
                    {include file='catalog/_partials/miniatures/brand.tpl' brand=$brand}
                {/foreach}
            </ul>
        {/block}

    </section>

{/block}