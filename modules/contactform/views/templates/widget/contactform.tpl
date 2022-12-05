<section class="contact-form custom__contact-form">
    <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"
        {/if}>
        {if $notifications}
            <div class="alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
                <ul>
                    {foreach $notifications.messages as $notif}
                        <li>{$notif}</li>
                    {/foreach}
                </ul>
            </div>
        {/if}

        {if !$notifications || $notifications.nw_error}
            <div class="form-title">
                <h1>Nous contacter</h1>
                <strong>Vous avez une question sur un produit ? Vous souhaitez effectuer un retour ou tout
                    simplement nous dire à quel point vous êtes heureux.se de votre achat ?</strong>
                <strong>C'est ici</strong>
        </div>

        <section class="form-fields custom__form-fields">


            <div class="form-group">
                <label class="form-control-label" for="id_contact">{l s='Subject' d='Shop.Forms.Labels'}</label>
                <select name="id_contact" id="id_contact" class="form-control form-control-select">
                    {foreach from=$contact.contacts item=contact_elt}
                    <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
                    {/foreach}
                </select>
            </div>

            <div class="form-group">
                <label class="form-control-label" for="email">{l s='Email address' d='Shop.Forms.Labels'}</label>
                <input id="email" class="form-control" name="from" type="email" value="{$contact.email}"
                    placeholder="{l s='your@email.com' d='Shop.Forms.Help'}">
            </div>

            {if $contact.orders}
            <div class="form-group">
                <label class="form-control-label" for="id-order">{l s='Order reference' d='Shop.Forms.Labels'}</label>
                <select id="id-order" name="id_order" class="form-control form-control-select">
                    <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                    {foreach from=$contact.orders item=order}
                    <option value="{$order.id_order}">{$order.reference}</option>
                    {/foreach}
                </select>
                <span class="form-control-comment">
                    {l s='optional' d='Shop.Forms.Help'}
                </span>
            </div>
            {/if}

            {if $contact.allow_file_upload}
            <div class="form-group row">
                <label class="form-control-label" for="file-upload">{l s='Attachment' d='Shop.Forms.Labels'}</label>
                <input id="file-upload" type="file" name="fileUpload" class="filestyle"
                    data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
                <span class="col-md-3 form-control-comment">
                    {l s='optional' d='Shop.Forms.Help'}
                </span>
            </div>
            {/if}

            <div class="form-group">
                <label class="form-control-label"
                    for="contactform-message">{l s='Message' d='Shop.Forms.Labels'}</label>
                <textarea id="contactform-message" class="form-control" name="message"
                    placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
                    rows="3">{if $contact.message}{$contact.message}{/if}</textarea>
            </div>

            {if isset($id_module)}
            <div class="form-group">
                <div class="module-div">
                    {hook h='displayGDPRConsent' id_module=$id_module}
                </div>
            </div>
            {/if}

        </section>
        <footer class="form-footer custom__form-footer">
            <style>
                input[name=url] {
                    display: none !important;
                }
            </style>
            <input type="text" name="url" value="" />
            <input type="hidden" name="token" value="{$token}" />
            <input class="btn btn-primary" type="submit" name="submitMessage"
                value="{l s='Send' d='Shop.Theme.Actions'}">
            </footer>

        {/if}

    </form>
</section>