 {extends file='page.tpl'}

 {block name='page_title'}
     <span class="title_auth">
         {l s='Create an account' d='Shop.Theme.Customeraccount'}
     </span>
 {/block}

 {block name='page_content'}
     <div class="no-account" id="custom__no-account">
         <p>{l s='Already have an account?' d='Shop.Theme.Customeraccount'}&nbsp;</p>
         <a href="{$urls.pages.authentication}">Cliquez ici</a>
     </div>
     {block name='register_form_container'}
         {$hook_create_account_top nofilter}
         <section class="register-form custom-auth" id="resigter__custom">
             {render file='customer/_partials/customer-form.tpl' ui=$register_form}
         </section>
     {/block}
{/block}