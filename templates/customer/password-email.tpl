 {extends file='page.tpl'}

 {block name='page_title'}
     <span class="title_auth">
         {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
     </span>
 {/block}

 {block name='page_content'}
     <form action="{$urls.pages.password}" class="forgotten-password" method="post">

         <ul class="ps-alert-error">
             {foreach $errors as $error}
                 <li class="item">
                     <i>
                         <svg viewBox="0 0 24 24">
                             <path fill="#fff"
                                 d="M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z">
                             </path>
                         </svg>
                     </i>
                     <p>{$error}</p>
                 </li>
             {/foreach}
         </ul>

         <header>
             <p class="send-renew-password-link">
                 {l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}
             </p>
         </header>

         <section class="form-fields custom-auth">
             <div class="form-group center-email-fields connect-input__container">
                 <label class="col-md-3 form-control-label required">{l s='Email address' d='Shop.Forms.Labels'}</label>
                 <div class="col-md-5 email">
                     <input type="email" name="email" id="email"
                         value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="form-control"
                         required>
                 </div>
             </div>

             <footer class="form-footer custom-login-footer clearfix">
                 <button id="send-reset-link" class="form-control-submit btn btn-primary hidden-xs-down" name="submit"
                     type="submit">
                     {l s='Send reset link' d='Shop.Theme.Actions'}
                 </button>
                 <button class="form-control-submit btn btn-primary hidden-sm-up" name="submit" type="submit">
                     {l s='Send' d='Shop.Theme.Actions'}
                 </button>
             </footer>
         </section>

     </form>

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

 {block name='page_footer'}
     <a id="back-to-login" href="{$urls.pages.my_account}" class="account-link">
         <i class="material-icons">&#xE5CB;</i>
         <span>{l s='Back to login' d='Shop.Theme.Actions'}</span>
     </a>
{/block}