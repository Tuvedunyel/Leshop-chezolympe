 {extends file='page.tpl'}

 {block name='page_title'}
     <span class="title_auth">
         Se connecter
     </span>
 {/block}

 {block name='page_content'}
     <div class="no-account" id="custom__no-account">
         <p>Pas encore de compte ?&nbsp;</p>
         <a href="{$urls.pages.register}" data-link-action="display-register-form">
             Cliquez ici
         </a>
     </div>
     {block name='login_form_container'}
         <section class="login-form custom-auth">
             {render file='customer/_partials/login-form.tpl' ui=$login_form}
         </section>
         <hr />
         {block name='display_after_login_form'}
             {hook h='displayCustomerLoginFormAfter'}
         {/block}
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