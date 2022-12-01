<span class="sort-by custom__sort-by-text">{l s='Sort by:' d='Shop.Theme.Global'}</span>
<div class="products-sort-order dropdown">
    <button class="btn-unstyle select-title custom__button-dropdown" rel="nofollow" data-toggle="dropdown"
        aria-label="{l s='Sort by selection' d='Shop.Theme.Global'}" aria-haspopup="true" aria-expanded="false">
        {if $listing.sort_selected}{$listing.sort_selected}{else}{l s='Select' d='Shop.Theme.Actions'}{/if}
        <i class="material-icons float-xs-right">&#10095;</i>
    </button>
    <div class="dropdown-menu">
        {foreach from=$listing.sort_orders item=sort_order}
            <a rel="nofollow" href="{$sort_order.url}"
                class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}">
                {$sort_order.label}
            </a>
        {/foreach}
    </div>
</div>