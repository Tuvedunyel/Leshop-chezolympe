<div class="product-variants js-product-variants">
    {foreach from=$groups key=id_attribute_group item=group}
        {if !empty($group.attributes)}
            <div class="clearfix product-variants-item">
                {if $group.group_type == 'select'}
                    <span class="control-label taille-texte">{$group.name}{l s=': ' d='Shop.Theme.Catalog'}</span>
                    <select class="form-control form-control-select select-to-change" id="group_{$id_attribute_group}"
                        aria-label="{$group.name}" data-product-attribute="{$id_attribute_group}"
                        name="group[{$id_attribute_group}]">
                        {foreach from=$group.attributes key=id_attribute item=group_attribute}
                            <option value="{$id_attribute}" title="{$group_attribute.name}" {if $group_attribute.selected}
                                selected="selected" {/if}>{$group_attribute.name}</option>
                        {/foreach}
                    </select>
                    <div class="btn-taille">
                        {foreach from=$group.attributes key=id_attribute item=group_attribute}
                            <p class="btn-select" id="{$id_attribute}">{$group_attribute.name}</p>
                        {/foreach}
                    </div>
                {elseif $group.group_type == 'color'}
                    <span class="control-label taille-texte" id="group-name">{$group.name}{l s=': ' d='Shop.Theme.Catalog'}
                        <span class="color-return">
                            {foreach from=$group.attributes key=id_attribute item=group_attribute}
                                {if $group_attribute.selected}{$group_attribute.name}{/if}
                            {/foreach}
                        </span>
                    </span>
                    <ul id="group_{$id_attribute_group}" class="color-controller">
                        {foreach from=$group.attributes key=id_attribute item=group_attribute}
                            <li class="float-xs-left input-container" {if $group_attribute.html_color_code}
                                style="border-color: {$group_attribute.html_color_code}" {/if}>
                                <label aria-label="{$group_attribute.name}">
                                    <input class="input-color" type="radio" data-product-attribute="{$id_attribute_group}"
                                        name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"
                                        {if $group_attribute.selected} checked="checked" {/if}>
                                    <span {if $group_attribute.texture} class="color texture"
                                            style="background-image: url({$group_attribute.texture})"
                                        {elseif $group_attribute.html_color_code} class="color"
                                        style="background-color: {$group_attribute.html_color_code}" {/if}><span
                                            class="attribute-name sr-only">{$group_attribute.name}</span></span>
                                </label>
                            </li>
                        {/foreach}
                    </ul>
                {elseif $group.group_type == 'radio'}
                    <ul id="group_{$id_attribute_group}">
                        {foreach from=$group.attributes key=id_attribute item=group_attribute}
                            <li class="input-container float-xs-left">
                                <label>
                                    <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}"
                                        name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"
                                        {if $group_attribute.selected} checked="checked" {/if}>
                                    <span class="radio-label">{$group_attribute.name}</span>
                                </label>
                            </li>
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {/if}
    {/foreach}
</div>