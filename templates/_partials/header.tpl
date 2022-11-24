{extends file='parent:_partials/header.tpl'}

{block name='header_nav'}
    <div class="header__container">
      <section class="logo_details">
        {if $shop.logo_details}
          {renderLogo}
        {/if}
      </section>
      <nav class="menu">
        <div id="burger_menu">
          <span></span><span></span><span></span>
        </div>
        <div class="responsive-header__container">
          {hook h='displayTop'}
        </div>
      </nav>
      <nav id="card-nav">
        {hook h='displayNav2'}
      </nav>
    </div>
{/block}

{block name='header_top'}
  
  {hook h='displayNavFullWidth'}
{/block}
