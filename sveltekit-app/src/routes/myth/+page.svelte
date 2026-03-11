<script lang="ts">
  import Footer from '$lib/components/Footer.svelte';
  import PageNav from '$lib/components/PageNav.svelte';
  import { getContent } from '$lib/content/get-content';

  const page = getContent('myth');

  const navItems = [
    { label: 'MUSIC', href: '/music' },
    { label: 'MYTH', current: true },
    { label: 'AXZIO', href: '/axzio' },
    { label: 'E3', href: '/engine' }
  ];
</script>

<svelte:head>
  <title>{page.title} — NE3ULA</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="description" content={page.description} />
</svelte:head>

<main class="wrap">
  <div class="card lore-shell">
    <section class="lore-section">
      <h1>{page.title}</h1>

      {#each page.sections as section, index}
        <h2>{section.heading}</h2>

        {#each section.body as paragraph}
          <p>{paragraph}</p>
        {/each}

        {#if index < page.sections.length - 1}
          <hr />
        {/if}
      {/each}
    </section>

    <PageNav items={navItems} />
  </div>
</main>

<Footer />

<style>
  :global(body) {
    background: #05060a;
  }

  .wrap {
    width: min(980px, calc(100vw - 48px));
    margin: 0 auto;
    min-height: 100vh;
    display: grid;
    place-items: start center;
    padding: 8vh 0 96px;
    box-sizing: border-box;
  }

  .card {
    width: 100%;
    border: 1px solid rgba(255, 255, 255, 0.14);
    border-radius: 22px;
    background: rgba(0, 0, 0, 0.35);
    padding: 28px 26px;
    box-sizing: border-box;
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    box-shadow: 0 28px 120px rgba(0, 0, 0, 0.55);
  }

  .lore-shell {
    text-align: left;
    display: grid;
    gap: 18px;
    cursor: default;
  }

  .lore-section h1,
  .lore-section h2,
  .lore-section p {
    margin: 0;
  }

  .lore-section h1 {
    margin: 0.7rem 0 1rem;
    font-size: clamp(2rem, 4vw, 2.625rem);
    letter-spacing: 0.02em;
  }

  .lore-section h2 {
    margin-bottom: 10px;
    font-size: 18px;
    letter-spacing: 0.08em;
    text-transform: uppercase;
  }

  .lore-section p {
    color: rgba(255, 255, 255, 0.62);
    font-size: 15px;
    line-height: 1.6;
    white-space: pre-line;
  }

  hr {
    width: 100%;
    border: 0;
    border-top: 1px solid rgba(255, 255, 255, 0.12);
    margin: 2px 0;
  }

  @media (max-width: 720px) {
    .wrap {
      width: min(100vw - 32px, 980px);
      padding: 36px 0 88px;
    }

    .card {
      padding: 22px;
      border-radius: 20px;
    }

  }
</style>
