{extends file=$layout}

{block name='content'}

    <section id="main">
        <div class="cart-grid custom-cart">

            <!-- Left Block: cart product informations & shpping -->
            <div class="cart-grid-body">

                <!-- cart products detailed -->
                <div class="card cart-container">
                    <div class="card-block">
                        <h1 class="h1">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
                    </div>
                    <hr class="separator">
                    {block name='cart_overview'}
                        {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
                    {/block}
                </div>

                {block name='continue_shopping'}
                    <a class="label" id="continue-shopping__custom" href="{$urls.pages.index}">
                        {l s='Continue shopping' d='Shop.Theme.Actions'}
                    </a>
                {/block}

                <!-- shipping informations -->
                {block name='hook_shopping_cart_footer'}
                    {hook h='displayShoppingCartFooter'}
                {/block}
            </div>

            <!-- Right Block: cart subtotal & cart total -->
            <div class="cart-grid-right custom__cart-grid-right">

                {block name='cart_summary'}
                    <div class="card cart-summary">

                        {block name='hook_shopping_cart'}
                            {hook h='displayShoppingCart'}
                        {/block}

                        {block name='cart_totals'}
                            {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
                        {/block}

                        {block name='cart_actions'}
                            {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
                        {/block}

                    </div>
                {/block}

                {block name='hook_reassurance'}
                    {hook h='displayReassurance'}
                {/block}

            </div>

        </div>
    </section>
{/block}