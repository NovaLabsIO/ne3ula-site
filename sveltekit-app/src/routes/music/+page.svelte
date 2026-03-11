<script lang="ts">
  import Footer from '$lib/components/Footer.svelte';
  import PageNav from '$lib/components/PageNav.svelte';
  import { getContent } from '$lib/content/get-content';

  const page = getContent('music');

  const navItems = [
    { label: 'MYTH', href: '/myth' },
    { label: 'AXZIO', href: '/axzio' },
    { label: 'E3', href: '/engine' }
  ];

  const featuredReleases = page.sections.find((section) => section.id === 'featured-releases');
  const liveSection = page.sections.find((section) => section.id === 'live');
  const educationSection = page.sections.find((section) => section.id === 'education');
  const servicesSection = page.sections.find((section) => section.id === 'services');
  const productsSection = page.sections.find((section) => section.id === 'products');
</script>

<svelte:head>
  <title>{page.title} — NE3ULA</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="description" content={page.description} />
</svelte:head>

<main class="wrap">
  <div class="music-shell">
    <section class="card music-header">
      <div class="kicker">NE3ULA</div>
      <h1>{page.title}</h1>
      <p class="music-subline">{page.metadata?.subline}</p>

      <PageNav items={navItems} className="music-nav" />
    </section>

    {#if featuredReleases}
      <section class="card music-section">
        <h2>{featuredReleases.heading}</h2>

        <div class="music-grid">
          {#each featuredReleases.items ?? [] as release}
            <article class="music-item">
              <h3>{release.title}</h3>
              {#if release.metadata?.year}
                <p>{release.metadata.year}</p>
              {/if}
              {#if release.links?.length}
                <div class="music-links">
                  {#each release.links as link}
                    <a class="page-btn" href={link.href} target="_blank" rel="noopener noreferrer">{link.label}</a>
                  {/each}
                </div>
              {/if}
            </article>
          {/each}
        </div>

        {#if featuredReleases.links?.length}
          <p class="music-note">
            {#each featuredReleases.links as link}
              <a class="page-btn" href={link.href} target="_blank" rel="noopener noreferrer">{link.label}</a>
            {/each}
          </p>
        {/if}
      </section>
    {/if}

    {#if liveSection}
      <section class="card music-section">
        <h2>{liveSection.heading}</h2>

        <div class="music-row">
          {#each liveSection.items ?? [] as item}
            <article class="music-item">
              <h3>{item.title}</h3>

              {#if item.links?.length}
                <div class="music-links">
                  {#each item.links as link}
                    <a class="page-btn" href={link.href} target="_blank" rel="noopener noreferrer">
                      {link.label}
                    </a>
                  {/each}
                </div>
              {/if}

              {#if item.body?.length}
                {#each item.body as paragraph}
                  <p>{paragraph}</p>
                {/each}
              {/if}
            </article>
          {/each}
        </div>

        {#each liveSection.body as paragraph}
          <p class="music-note">{paragraph}</p>
        {/each}
      </section>
    {/if}

    {#if educationSection}
      <section class="card music-section">
        <h2>{educationSection.heading}</h2>

        {#each educationSection.items ?? [] as item}
          <article class="music-item">
            <h3>{item.title}</h3>
            {#if item.links?.length}
              <div class="music-links">
                {#each item.links as link}
                  <a class="page-btn" href={link.href} target="_blank" rel="noopener noreferrer">
                    {link.label}
                  </a>
                {/each}
              </div>
            {/if}
            {#if item.body?.length}
              {#each item.body as paragraph}
                <p class:music-muted={item.metadata?.tone === 'muted'}>{paragraph}</p>
              {/each}
            {/if}
          </article>
        {/each}
      </section>
    {/if}

    {#if servicesSection}
      <section class="card music-section">
        <h2>{servicesSection.heading}</h2>

        <div class="music-row">
          {#each servicesSection.items ?? [] as item}
            <article class="music-item">
              <h3>{item.title}</h3>

              {#if item.links?.length}
                <div class="music-links">
                  {#each item.links as link}
                    <a class="page-btn" href={link.href} target="_blank" rel="noopener noreferrer">
                      {link.label}
                    </a>
                  {/each}
                </div>
              {/if}

              {#if item.metadata?.format === 'bullets' && item.body?.length}
                <ul class="music-bullets">
                  {#each item.body as bullet}
                    <li>{bullet}</li>
                  {/each}
                </ul>
              {:else if item.body?.length}
                {#each item.body as paragraph}
                  <p>{paragraph}</p>
                {/each}
              {/if}
            </article>
          {/each}
        </div>
      </section>
    {/if}

    {#if productsSection}
      <section class="card music-section">
        <h2>{productsSection.heading}</h2>

        <div class="music-row">
          {#each productsSection.items ?? [] as item}
            <article class="music-item">
              <h3>{item.title}</h3>

              {#if item.body?.length}
                {#each item.body as paragraph}
                  <p>{paragraph}</p>
                {/each}
              {/if}

              {#if item.metadata?.muted}
                <p class="music-muted">{item.metadata.muted}</p>
              {/if}
            </article>
          {/each}
        </div>
      </section>
    {/if}
  </div>
</main>

<Footer variant="compact" />

<style>
  :global(body) {
    background: #000;
  }

  .wrap {
    width: min(1100px, calc(100vw - 48px));
    margin: 0 auto;
    padding: 48px 0 96px;
    box-sizing: border-box;
  }

  .music-shell {
    display: grid;
    gap: 24px;
  }

  .card {
    border: 1px solid rgba(255, 255, 255, 0.16);
    border-radius: 24px;
    background:
      linear-gradient(180deg, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0.02)),
      rgba(255, 255, 255, 0.02);
    padding: 28px;
    box-sizing: border-box;
  }

  .music-header {
    text-align: center;
    display: grid;
    gap: 12px;
  }

  .kicker {
    font-size: 12px;
    letter-spacing: 0.35em;
    opacity: 0.65;
  }

  h1,
  h2,
  h3,
  p {
    margin: 0;
  }

  h1 {
    font-size: clamp(2rem, 4vw, 4rem);
    line-height: 1;
  }

  h2 {
    margin-bottom: 18px;
    font-size: 1.4rem;
    letter-spacing: 0.08em;
    text-transform: uppercase;
  }

  h3 {
    font-size: 1.1rem;
    margin-bottom: 10px;
  }

  .music-subline,
  .music-note,
  .music-muted {
    opacity: 0.72;
  }

  .music-links {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
  }

  :global(.music-nav) {
    margin-top: 8px;
  }

  .music-grid,
  .music-row {
    display: grid;
    gap: 18px;
  }

  .music-grid {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }

  .music-row {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }

  .music-item {
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 18px;
    padding: 20px;
    display: grid;
    gap: 12px;
    background: rgba(255, 255, 255, 0.02);
    box-sizing: border-box;
  }

  .music-note {
    margin-top: 18px;
  }

  .music-bullets {
    margin: 0;
    padding-left: 18px;
    opacity: 0.78;
    display: grid;
    gap: 8px;
  }

  @media (max-width: 900px) {
    .music-grid,
    .music-row {
      grid-template-columns: 1fr;
    }
  }

  @media (max-width: 720px) {
    .wrap {
      width: min(100vw - 32px, 1100px);
      padding: 36px 0 88px;
    }

    .card {
      padding: 22px;
      border-radius: 20px;
    }

  }
</style>
