<script lang="ts">
  import Footer from '$lib/components/Footer.svelte';
</script>

<svelte:head>
  <title>HOME — NE3ULA</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="description" content="Choose your path through the NE3ULA." />
</svelte:head>

<main class="wrap home-hub">
  <div class="home-header">
    <div class="home-kicker">NE3ULA</div>
    <h1>Choose Your Path</h1>
    <p>Each path reveals a different way to experience the NE3ULA</p>
  </div>

  <div class="home-grid">
    <a class="card-link" href="/music">
      <div class="home-card card">
        <span class="home-card-label">MUSIC</span>
        <span class="home-card-subtitle">Signal</span>
      </div>
    </a>

    <a class="card-link" href="/myth">
      <div class="home-card card">
        <span class="home-card-label">MYTH</span>
        <span class="home-card-subtitle">Myth</span>
      </div>
    </a>

    <a class="card-link" href="/axzio">
      <div class="home-card card">
        <span class="home-card-label">AXZIO</span>
        <span class="home-card-subtitle">Interface</span>
      </div>
    </a>

    <a class="card-link" href="/engine">
      <div class="home-card card">
        <span class="home-card-label">E3</span>
        <span class="home-card-subtitle">Engine</span>
      </div>
    </a>
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
  }

  .home-hub {
    min-height: 100vh;
    display: grid;
    align-content: center;
    gap: 40px;
    padding: 48px 0 96px;
    box-sizing: border-box;
  }

  .home-header {
    text-align: center;
    display: grid;
    gap: 12px;
  }

  .home-kicker {
    font-size: 12px;
    letter-spacing: 0.35em;
    opacity: 0.65;
  }

  h1 {
    margin: 0;
    font-size: clamp(2rem, 4vw, 4rem);
    line-height: 1;
  }

  p {
    margin: 0;
    opacity: 0.72;
    font-size: 1rem;
  }

  .home-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 20px;
  }

  .card-link {
    text-decoration: none;
    color: inherit;
  }

  .card,
  .home-card {
    min-height: 180px;
    border: 1px solid rgba(255, 255, 255, 0.16);
    border-radius: 24px;
    background:
      linear-gradient(180deg, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0.02)),
      rgba(255, 255, 255, 0.02);
    display: grid;
    place-items: center;
    text-align: center;
    gap: 10px;
    padding: 20px;
    box-sizing: border-box;
    transition:
      transform 160ms ease,
      border-color 160ms ease,
      background 160ms ease;
  }

  .card-link:hover .home-card {
    transform: translateY(-2px);
    border-color: rgba(255, 255, 255, 0.28);
    background:
      linear-gradient(180deg, rgba(255, 255, 255, 0.08), rgba(255, 255, 255, 0.03)),
      rgba(255, 255, 255, 0.03);
  }

  .home-card-label {
    display: block;
    font-size: 1.4rem;
    font-weight: 700;
    letter-spacing: 0.16em;
  }

  .home-card-subtitle {
    display: block;
    font-size: 0.95rem;
    opacity: 0.65;
    letter-spacing: 0.08em;
    text-transform: uppercase;
  }

  @media (max-width: 720px) {
    .wrap {
      width: min(100vw - 32px, 1100px);
    }

    .home-hub {
      padding: 40px 0 88px;
      gap: 28px;
    }

    .home-grid {
      grid-template-columns: 1fr;
    }

    .card,
    .home-card {
      min-height: 140px;
      border-radius: 20px;
    }

  }
</style>
