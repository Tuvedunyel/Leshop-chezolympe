 {block name='customer_form'}
     {block name='customer_form_errors'}
         {include file='_partials/form-errors.tpl' errors=$errors['']}
     {/block}

     <form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form"
         method="post">
         <div class="connect-input__container" id="registration__custom">
             {block "form_fields"}
                 {foreach from=$formFields item="field"}
                     {block "form_field"}
                         {form_field field=$field}
                     {/block}
                 {/foreach}
                 {$hook_create_account_form nofilter}
             {/block}
         </div>

         {block name='customer_form_footer'}
             <footer class="form-footer custom-login-footer clearfix">
                 <input type="hidden" name="submitCreate" value="1">
                 {block "form_buttons"}
                     <button id="custom__create-account" class="btn btn-primary form-control-submit float-xs-right"
                         data-link-action="save-customer" type="submit">
                         Créer mon compte
                     </button>
                 {/block}
             </footer>
         {/block}

     </form>
{/block}