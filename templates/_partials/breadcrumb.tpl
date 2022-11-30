 <nav data-depth="{$breadcrumb.count}" class="breadcrumb hidden-sm-down" id="custom__breadcrumb">
     <ol>
         {block name='breadcrumb'}
             {foreach from=$breadcrumb.links item=path name=breadcrumb}
                 {block name='breadcrumb_item'}
                     <li>
                         {if not $smarty.foreach.breadcrumb.last}
                             <a href="{$path.url}">{$path.title}</a>
                         {else}
                             <span>{$path.title}</span>
                         {/if}
                     </li>
                 {/block}
             {/foreach}
         {/block}
     </ol>
</nav>