<script lang="ts">
  import Footer from '$lib/components/Footer.svelte';
  import PageNav from '$lib/components/PageNav.svelte';

  type NavItem = {
    label: string;
    href?: string;
    current?: boolean;
  };

  let {
    title,
    description,
    bodyText,
    navItems,
    backgroundImageUrl
  }: {
    title: string;
    description: string;
    bodyText: string;
    navItems: NavItem[];
    backgroundImageUrl?: string;
  } = $props();
</script>

<svelte:head>
  <title>{title} — NE3ULA</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="description" content={description} />
</svelte:head>

{#if backgroundImageUrl}
  <div class="stage" style={`background-image: url('${backgroundImageUrl}')`}></div>
{/if}

<main class="wrap">
  <div class="card placeholder-card">
    <div class="kicker">NE3ULA</div>
    <h1>{title}</h1>
    <p>{bodyText}</p>

    <PageNav items={navItems} className="placeholder-nav" />
  </div>
</main>

<Footer />

<style>
  :global(body) {
    background:
      radial-gradient(circle at 50% 18%, rgba(255, 255, 255, 0.08), transparent 34%),
      radial-gradient(circle at 50% 0%, rgba(255, 255, 255, 0.03), transparent 52%),
      linear-gradient(180deg, #020202 0%, #05060a 46%, #020202 100%);
  }

  .wrap {
    width: min(980px, calc(100vw - 48px));
    margin: 0 auto;
    min-height: 100vh;
    display: grid;
    place-items: start center;
    padding: 8vh 0 96px;
    box-sizing: border-box;
    position: relative;
    z-index: 2;
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

  .placeholder-card {
    text-align: center;
  }

  .stage {
    position: fixed;
    inset: 0;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    z-index: 0;
  }

  .kicker {
    font-size: 12px;
    letter-spacing: 0.35em;
    opacity: 0.65;
  }

  h1,
  p {
    margin: 0;
  }

  h1 {
    margin: 0.7rem 0 0.3rem;
    font-size: clamp(2rem, 4vw, 2.625rem);
    line-height: 1;
    letter-spacing: 0.02em;
  }

  p {
    color: rgba(255, 255, 255, 0.62);
    font-size: 16px;
    line-height: 1.6;
  }

  :global(.placeholder-nav) {
    margin-top: 20px;
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
