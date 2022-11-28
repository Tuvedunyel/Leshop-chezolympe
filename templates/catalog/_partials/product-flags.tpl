{block name='product_flags'}
    <ul class="flags">
        {foreach from=$product.flags item=flag}
            {if $flag.type !== 'discount'}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
            {/if}
        {/foreach}
    </ul>
{/block}