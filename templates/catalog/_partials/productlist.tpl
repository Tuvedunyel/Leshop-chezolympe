{capture assign="productClasses"}{if !empty($productClass)}{$productClass}{else}col-xs-6 col-xl-4{/if}{/capture}

<div class="products{if !empty($cssClass)} {$cssClass}{/if}">
	{foreach from=$products item="product" key="position" name=foo}
		 {if $smarty.foreach.foo.iteration < 5}
		    {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses=$productClasses}
		{/if}
	{/foreach}
</div>
