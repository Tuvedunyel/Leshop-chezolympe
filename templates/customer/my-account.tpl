{extends file='customer/page.tpl'}

{block name='page_title'}
    {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    <div class="my-account__link-container">
        <div class="links">

            <a class="link" id="identity-link" href="{$urls.pages.identity}">
                <img src="{$urls.img_url}mes-informations.svg" alt="Mes informations">
                <span>Mes informations</span>
            </a>

            {if $customer.addresses|count}
                <a class="link" id="addresses-link" href="{$urls.pages.addresses}">
                    <img src="{$urls.img_url}pin-house.svg" alt="Mes adresses">
                    <p>Mes adresses</p>
                </a>
            {else}
                <a class="link" id="address-link" href="{$urls.pages.address}">
                    <img src="{$urls.img_url}pin-house.svg" alt="Ajouter une première adresses">
                    <span>Ajouter une première adresse</span>
                </a>
            {/if}

            {if !$configuration.is_catalog}
                <a class="link" id="history-link" href="{$urls.pages.history}">
                    <img src="{$urls.img_url}commande.svg" alt="Historique et détails de mes commande">
                    <span>
                        {l s='Order history and details' d='Shop.Theme.Customeraccount'}
                    </span>
                </a>
            {/if}

            {if !$configuration.is_catalog}
                <a class="link" id="order-slips-link" href="{$urls.pages.order_slip}">
                    <img src="{$urls.img_url}avoirs.svg" alt="Mes avoirs">
                    <span>
                        {l s='Credit slips' d='Shop.Theme.Customeraccount'}
                    </span>
                </a>
            {/if}

            {if $configuration.voucher_enabled && !$configuration.is_catalog}
                <a class="link" id="discounts-link" href="{$urls.pages.discount}">
                    <i class="material-icons">&#xE54E;</i>
                    {l s='Vouchers' d='Shop.Theme.Customeraccount'}
                </a>
            {/if}

            {if $configuration.return_enabled && !$configuration.is_catalog}
                <a class="link" id="returns-link" href="{$urls.pages.order_follow}">
                    <i class="material-icons">&#xE860;</i>
                    {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
                </a>
            {/if}
            <a class="link" href="https://leshop-chezolympe.test/module/blockwishlist/lists"
                title="{l s='My Wishlists' mod='blockwishlist'}">
                <img src="{$urls.img_url}listes.svg" alt="Mes listes d'envies">
                <span>Mes listes</span>
            </a>

            {block name='display_customer_account'}
                {* {hook h='displayCustomerAccount'} *}
            {/block}

        </div>
    </div>
{/block}


{block name='page_footer'}
    {block name='my_account_links'}
        <div class="text-sm-center">
            <a href="{$urls.actions.logout}">
                {l s='Sign out' d='Shop.Theme.Actions'}
            </a>
        </div>
    {/block}
{/block}