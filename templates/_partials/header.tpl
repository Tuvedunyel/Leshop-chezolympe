{extends file='parent:_partials/header.tpl'}

{block name='header_nav'}
  <header>
    <div class="header__container">
      <section class="logo_details">
        {if $shop.logo_details}
          {if $page.page_name == 'index'}
            <h1>{renderLogo}</h1>
          {else}
            {renderLogo}
          {/if}
        {/if}
      </section>
      <nav class="menu">
        {hook h='displayTop'}
      </nav>
      <nav id="card-nav">
        {hook h='displayNav2'}
      </nav>
    </div>
  </header>
{/block}

{block name='header_top'}
  
  {hook h='displayNavFullWidth'}
{/block}
