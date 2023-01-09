<nav class="pagination custom-pagination">

    <div>
        {block name='pagination_page_list'}
            {if $pagination.should_be_displayed}
                <ul class="page-list clearfix text-sm-center">
                    {foreach from=$pagination.pages item="page"}


                        <li {if $page.current} class="current margin-inline" {/if}
                            {if $page.type !== 'previous' || !$page.type !== 'next'} class="margin-inline" {/if}>
                            {if $page.type === 'spacer'}
                                <span class="spacer">&hellip;</span>
                            {else}
                                <a rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
                                    href="{$page.url}"
                                    class="{if $page.type === 'previous'}previous {elseif $page.type === 'next'}next {/if}{['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}">
                                    {if $page.type === 'previous'}
                                        <i class="material-icons previous-icon">&#xE314;</i><span class="screen-reader-text">
                                            {l s='Previous' d='Shop.Theme.Actions'}
                                        </span>
                                    {elseif $page.type === 'next'}
                                        <span class="screen-reader-text">
                                            {l s='Next' d='Shop.Theme.Actions'}
                                        </span>
                                        <i class="material-icons next-icon">&#xE315;</i>
                                    {else}
                                        <span class="page-number">
                                            {$page.page}
                                        </span>
                                    {/if}
                                </a>
                            {/if}
                        </li>
                    {/foreach}
                </ul>
            {/if}
        {/block}
    </div>

</nav>