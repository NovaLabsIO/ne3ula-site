<svelte:head>
  <title>MYTH — NE3ULA</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="description" content="The NE3ULA myth and architecture of becoming." />
</svelte:head>

<main class="wrap">
  <div class="card lore-shell">
    <section class="lore-section">
      <h1>MYTH</h1>

      <h2>The Space Between</h2>
      <p>NE3ULA is the empty space between the noise.</p>
      <p>The raw, chaotic building blocks of existence.<br />Unformed. Unjudged. Unclaimed.</p>
      <p>It is where awareness returns<br />and chaos can be shaped into beauty.</p>
      <p>NE3ULA is not the structure.<br />It is the field in which structure becomes possible.</p>

      <hr />

      <h2>From Chaos to Creation</h2>
      <p>Chaos is not the enemy.<br />It is material.</p>
      <p>Emotion. Memory. Fear. Desire.<br />Frequency. Pattern. Energy.</p>
      <p>All of it can be composed.</p>
      <p>That is where legend begins.</p>

      <hr />

      <h2>The Architecture of Becoming</h2>
      <p>NE3ULA is the space.<br />Myth is the meaning.<br />AXZIO is the interface.<br />E3 is the engine.</p>
      <p>Each layer shapes the next.</p>
      <p>And all of it begins with space.</p>

      <hr />

      <h2>Live Your Legend</h2>
      <p>NE3ULA does not define you.</p>
      <p>It gives the space and framework<br />so you can decide who you are becoming.</p>
      <p>What legend will you choose?</p>
    </section>

    <div class="nav">
      <a class="btn" href="/music">MUSIC</a>
      <span class="btn nav-current" aria-current="page">MYTH</span>
      <a class="btn" href="/axzio">AXZIO</a>
      <a class="btn" href="/engine">E3</a>
    </div>
  </div>
</main>

<div class="footer">
  <span>© NE3ULA</span>
  <span>LIVE YOUR LEGEND</span>
</div>

<style>
  :global(html, body) {
    margin: 0;
    min-height: 100%;
    background:
      radial-gradient(circle at 50% 18%, rgba(255, 255, 255, 0.08), transparent 34%),
      radial-gradient(circle at 50% 0%, rgba(255, 255, 255, 0.03), transparent 52%),
      linear-gradient(180deg, #020202 0%, #05060a 46%, #020202 100%);
    color: #fff;
    font-family:
      system-ui,
      -apple-system,
      BlinkMacSystemFont,
      "Segoe UI",
      Roboto,
      Helvetica,
      Arial,
      sans-serif;
  }

  :global(body) {
    min-height: 100vh;
  }

  .wrap {
    width: min(980px, calc(100vw - 48px));
    margin: 0 auto;
    min-height: 100vh;
    display: grid;
    place-items: center;
    padding: 48px 0 96px;
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
  }

  hr {
    width: 100%;
    border: 0;
    border-top: 1px solid rgba(255, 255, 255, 0.12);
    margin: 2px 0;
  }

  .nav {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
    justify-content: center;
  }

  .btn {
    display: inline-block;
    text-decoration: none;
    color: #fff;
    padding: 12px 18px;
    border-radius: 14px;
    background: rgba(0, 0, 0, 0.28);
    border: 1px solid rgba(255, 255, 255, 0.18);
    letter-spacing: 0.12em;
    text-transform: uppercase;
    font-size: 0.82rem;
    transition:
      transform 160ms ease,
      border-color 160ms ease,
      background 160ms ease;
  }

  a.btn:hover {
    transform: translateY(-2px);
    border-color: rgba(255, 255, 255, 0.36);
    background: rgba(255, 255, 255, 0.06);
  }

  .nav-current {
    opacity: 0.7;
    pointer-events: none;
    cursor: default;
  }

  .footer {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    justify-content: space-between;
    gap: 16px;
    padding: 18px 24px;
    box-sizing: border-box;
    pointer-events: none;
  }

  .footer span {
    font-size: 11px;
    line-height: 1.2;
    letter-spacing: 0.38em;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.45);
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

    .footer {
      padding: 14px 16px;
    }

    .footer span {
      font-size: 10px;
      letter-spacing: 0.12em;
    }
  }
</style>
