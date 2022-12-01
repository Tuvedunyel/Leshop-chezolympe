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
{/block}