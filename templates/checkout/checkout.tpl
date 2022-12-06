{extends file=$layout}

{block name='header'}
    {include file='checkout/_partials/header.tpl'}
{/block}

{block name='content'}
    <section id="content" class="checkout-cart">
        <div class="check-out__container">
            <div class="cart-grid-body">
                {block name='checkout_process'}
                    {render file='checkout/checkout-process.tpl' ui=$checkout_process}
                {/block}
            </div>
            <div class="cart-grid-right">
                {block name='cart_summary'}
                    {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
                {/block}
                {hook h='displayReassurance'}
            </div>
        </div>
    </section>
{/block}

{block name='footer'}
    {include file='checkout/_partials/footer.tpl'}
{/block}