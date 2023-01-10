{function name="categories" nodes=[] depth=0}
    {strip}
        {if $nodes|count}
            <div class="category-sub-menu__container">
                <h2 id="show-cat">Catégories</h2>
                <ul class="category-sub-menu" id="sub-cat">
                    {foreach from=$nodes item=node}
                        <li data-depth="{$depth}">
                            {if $depth===0}
                                <a href="{$node.link}">{$node.name}</a>
                                {if $node.children}
                                    <div class="navbar-toggler collapse-icons" data-toggle="collapse"
                                        data-target="#exCollapsingNavbar{$node.id}">
                                        <i class="material-icons add">&#xE145;</i>
                                        <i class="material-icons remove">&#xE15B;</i>
                                    </div>
                                    <div class="collapse" id="exCollapsingNavbar{$node.id}">
                                        {categories nodes=$node.children depth=$depth+1}
                                    </div>
                                {/if}
                            {else}
                                <a class="category-sub-link" href="{$node.link}">{$node.name}</a>
                                {if $node.children}
                                    <span class="arrows" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                                        <i class="material-icons arrow-right">&#xE315;</i>
                                        <i class="material-icons arrow-down">&#xE313;</i>
                                    </span>
                                    <div class="collapse" id="exCollapsingNavbar{$node.id}">
                                        {categories nodes=$node.children depth=$depth+1}
                                    </div>
                                {/if}
                            {/if}
                        </li>
                    {/foreach}
                </ul>
            </div>
        {/if}
    {/strip}
{/function}

<div class="block-categories custom__tree">
    <ul class="category-top-menu">
        <li>
            <h1><a class="current-category" href="{$categories.link nofilter}">{$categories.name}</a></h1>
        </li>
        <li>{categories nodes=$categories.children}</li>
    </ul>
</div>