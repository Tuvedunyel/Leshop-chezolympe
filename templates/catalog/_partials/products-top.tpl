<div id="js-product-list-top" class="products-selection custom__product-selection">
    <div class="sort-by__container">
        {block name='sort_by'}
            {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}

        {if !empty($listing.rendered_facets)}
            <div class="filter-button custom__filter-button">
                <button id="search_filter_toggler" class="btn btn-secondary js-search-toggler">
                    {l s='Filter' d='Shop.Theme.Actions'}
                </button>
            </div>
        {/if}
    </div>
</div>