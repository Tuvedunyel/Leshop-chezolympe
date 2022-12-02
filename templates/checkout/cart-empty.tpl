{extends file='checkout/cart.tpl'}

{block name='content' append}
    {hook h='displayCrossSellingShoppingCart'}
{/block}

{block name='continue_shopping' append}
    <a class="label" id="continue-shopping__custom" href="{$urls.pages.index}">
        {l s='Continue shopping' d='Shop.Theme.Actions'}
    </a>
{/block}

{block name='cart_actions'}
    <div class="checkout card-block">
        <button type="button" class="btn btn-primary custom-command disabled"
            disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
    </div>
{/block}

{block name='continue_shopping'}{/block}
{block name='cart_voucher'}{/block}
{block name='display_reassurance'}{/block}