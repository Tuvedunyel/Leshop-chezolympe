{extends file='customer/page.tpl'}

{block name='page_title'}
    <span class="title__address-form">
        {l s='Your addresses' d='Shop.Theme.Customeraccount'}
    </span>
{/block}

{block name='page_content'}
    <div class="addresses-container">
        {foreach $customer.addresses as $address}
            <div class="address-container">
                {block name='customer_address'}
                    {include file='customer/_partials/block-address.tpl' address=$address}
                {/block}
            </div>
        {/foreach}
    </div>
    <div class="clearfix"></div>
    <div class="addresses-footer">
        <a href="{$urls.pages.address}" data-link-action="add-address">
            <i class="material-icons">&#xE145;</i>
            <span>{l s='Create new address' d='Shop.Theme.Actions'}</span>
        </a>
    </div>
{/block}