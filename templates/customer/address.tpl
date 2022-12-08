{extends file='customer/page.tpl'}

{block name='page_title'}
    <span class="title__address-form">
        {if $editing}
            {l s='Update your address' d='Shop.Theme.Customeraccount'}
        {else}
            {l s='New address' d='Shop.Theme.Customeraccount'}
        {/if}
    </span>
{/block}

{block name='page_content'}
    <div class="address-form">
        {render template="customer/_partials/address-form.tpl" ui=$address_form}
    </div>
{/block}