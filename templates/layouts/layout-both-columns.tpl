{include file='_partials/helpers.tpl'}

<!doctype html>
<html lang="{$language.locale}">

<head>
    {block name='head'}
        {include file='_partials/head.tpl'}
    {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {block name='hook_after_body_opening_tag'}
        {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <main>
        {block name='product_activation'}
            {include file='catalog/_partials/product-activation.tpl'}
        {/block}

        <header id="header">
            {block name='header'}
                {include file='_partials/header.tpl'}
            {/block}
        </header>

        <section id="wrapper">
            {block name='notifications'}
                {include file='_partials/notifications.tpl'}
            {/block}

            {hook h="displayWrapperTop"}
            <div class="container">
                {block name='breadcrumb'}
                    {include file='_partials/breadcrumb.tpl'}
                {/block}

                {block name="left_column"}
                    <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
                        {if $page.page_name == 'product'}
                            {hook h='displayLeftColumnProduct'}
                        {else}
                            {hook h="displayLeftColumn"}
                        {/if}
                    </div>
                {/block}

                {block name="content_wrapper"}
                    <div id="content-wrapper" class="js-content-wrapper left-column right-column col-sm-4 col-md-6">
                        {hook h="displayContentWrapperTop"}
                        {block name="content"}
                            <p>Hello world! This is HTML5 Boilerplate.</p>
                        {/block}
                        {hook h="displayContentWrapperBottom"}
                    </div>
                {/block}

                {block name="right_column"}
                    <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
                        {if $page.page_name == 'product'}
                            {hook h='displayRightColumnProduct'}
                        {else}
                            {hook h="displayRightColumn"}
                        {/if}
                    </div>
                {/block}
            </div>
            {hook h="displayWrapperBottom"}
            <section class="instagram">
                <div class="title-container">
                    <h2>Nous suivre sur instagram</h2>
                    <p>Suis-nous sur Instagram et retrouve tous nos conseils</p>
                </div>
            </section>

            <section class="benefits product-benefits">
                <div class="large-container">
                    <ul class="benefits-list">
                        <li>
                            <img src="{$urls.img_url}camion.svg" alt="Illustration d'un camion">
                            <p>Livraison rapide et gratuite dès 99€</p>
                        </li>
                        <li>
                            <img src="{$urls.img_url}cb.svg" alt="Illustration d'une carte bleue">
                            <p>Paiement sécurisé</p>
                        </li>
                        <li>
                            <img src="{$urls.img_url}cils.svg" alt="Illustration de cils">
                            <p>Livraison discrète</p>
                        </li>
                        <li>
                            <img src="{$urls.img_url}check.svg" alt="Illustration d'une main check">
                            <p>Satisfaite ou remboursée</p>
                        </li>
                    </ul>
                </div>
            </section>
        </section>

        <footer id="footer" class="js-footer">
            {block name="footer"}
                {include file="_partials/footer.tpl"}
            {/block}
        </footer>

    </main>

    {block name='javascript_bottom'}
        {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
        {hook h='displayBeforeBodyClosingTag'}
    {/block}
</body>

</html>