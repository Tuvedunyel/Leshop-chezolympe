{extends file=$layout}

{block name='head_microdata_special'}
    {include file='_partials/microdata/product-list-jsonld.tpl' listing=$listing}
{/block}

{block name='content'}
    {if $breadcrumb.links[1].title === "Résultats de la recherche"}
        <section id="main" class="custom-product-list search-part">
        {else}
            <section id="main" class="custom-product-list">
            {/if}

            {block name='product_list_header'}
                {* <h1 id="js-product-list-header title__custom-product-list" class="h2">{$category.name}</h1> *}
                <div class="custom-product-list__header">
                    {widget name='advancedcustomfields' hook='text'}
                </div>
            {/block}

            {block name='subcategory_list'}
            {/block}

            {hook h="displayHeaderCategory"}

            <section id="products">
                {if $listing.products|count}

                    {block name='product_list_top'}
                        {* Sort by *}
                        {include file='catalog/_partials/products-top.tpl' listing=$listing}
                    {/block}

                    {block name='product_list_active_filters'}
                        <div class="hidden-sm-down">
                            {$listing.rendered_active_filters nofilter}
                        </div>
                    {/block}

                    {block name='product_list'}
                        <div class="top-commu">
                            {include file='catalog/_partials/products.tpl' listing=$listing productClass="col-xs-6 col-xl-4"}
                        </div>
                    {/block}

                    {block name='product_list_bottom'}
                        {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
                    {/block}

                {else}
                    <div id="js-product-list-top"></div>

                    <div id="js-product-list">
                        {capture assign="errorContent"}
                            <h4>{l s='No products available yet' d='Shop.Theme.Catalog'}</h4>
                            <p>{l s='Stay tuned! More products will be shown here as they are added.' d='Shop.Theme.Catalog'}</p>
                        {/capture}

                        {include file='errors/not-found.tpl' errorContent=$errorContent}
                    </div>

                    <div id="js-product-list-bottom"></div>
                {/if}
            </section>

            {hook h="displayFooterCategory"}


        </section>
{/block}