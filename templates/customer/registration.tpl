 {extends file='page.tpl'}

 {block name='page_title'}
     <span class="title_auth">
         {l s='Create an account' d='Shop.Theme.Customeraccount'}
     </span>
 {/block}

 {block name='page_content'}
     <div class="no-account" id="custom__no-account">
         <p>{l s='Already have an account?' d='Shop.Theme.Customeraccount'}&nbsp;</p>
         <a href="{$urls.pages.authentication}">{l s='Log in instead!' d='Shop.Theme.Customeraccount'}</a>
     </div>
     {block name='register_form_container'}
         {$hook_create_account_top nofilter}
         <section class="register-form custom-auth" id="resigter__custom">
             {render file='customer/_partials/customer-form.tpl' ui=$register_form}
         </section>
     {/block}
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
{/block}