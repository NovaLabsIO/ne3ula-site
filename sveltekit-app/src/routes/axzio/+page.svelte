<script lang="ts">
  const pathways = [
    {
      label: 'Reflect',
      description: 'Notice patterns. Interrupt drift. See yourself clearly.'
    },
    {
      label: 'Create',
      description: 'Music. Thought. Identity. Momentum.'
    },
    {
      label: 'Become',
      description: 'Action with intent. Signal with self.'
    }
  ];
</script>

<svelte:head>
  <title>AXZIO Interface</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta
    name="description"
    content="AXZIO is the interface for reflection, creation, and becoming."
  />
</svelte:head>

<main class="enter-page">
  <header class="hero">
    <h1>BEGIN AXZIO</h1>
    <p>
      AXZIO is the interface for reflection, creation, and becoming.<br />
      No feeds. No performance. Just signal.
    </p>
  </header>

  <div class="center-cta">
    <a class="begin-btn" href="/begin">BEGIN</a>
  </div>

  <section class="pathway" aria-label="Core pathways">
    {#each pathways as pathway, index}
      <div class="cluster">
        <button class="path-item" type="button">{pathway.label}</button>
        <div class="info-box">{pathway.description}</div>
      </div>

      {#if index < pathways.length - 1}
        <span class="node" aria-hidden="true"></span>
      {/if}
    {/each}
  </section>

  <div class="nav">
    <a class="btn" href="/music">MUSIC</a>
    <a class="btn" href="/myth">MYTH</a>
    <span class="btn nav-current" aria-current="page">AXZIO</span>
    <a class="btn" href="/engine">E3</a>
  </div>
</main>

<div class="footer-line">
  <div class="left">© NE3ULA</div>
  <div class="right">LIVE YOUR LEGEND</div>
</div>

<style>
  :global(html, body) {
    margin: 0;
    min-height: 100%;
  }

  :global(body) {
    min-height: 100vh;
    color: rgba(245, 248, 255, 0.94);
    font-family:
      system-ui,
      -apple-system,
      BlinkMacSystemFont,
      'Segoe UI',
      Roboto,
      Helvetica,
      Arial,
      sans-serif;
    background:
      radial-gradient(circle at 50% 18%, rgba(182, 201, 255, 0.12), transparent 26%),
      radial-gradient(circle at 50% 65%, rgba(88, 113, 184, 0.1), transparent 42%),
      linear-gradient(to bottom, rgba(3, 4, 10, 0.55), rgba(2, 3, 8, 0.7)),
      linear-gradient(180deg, #02040a 0%, #070d1b 48%, #04070f 100%);
    background-attachment: fixed;
  }

  .enter-page {
    min-height: 100dvh;
    display: grid;
    grid-template-rows: auto 1fr auto auto;
    gap: 24px;
    padding: clamp(28px, 4vh, 56px) clamp(20px, 4vw, 56px) 132px;
    position: relative;
    box-sizing: border-box;
  }

  .hero {
    text-align: center;
    max-width: 900px;
    margin: 0 auto;
  }

  .hero h1,
  .hero p {
    margin: 0;
  }

  .hero h1 {
    font-size: clamp(30px, 4.5vw, 58px);
    line-height: 1.05;
    letter-spacing: 0.01em;
    text-wrap: balance;
    text-shadow: 0 8px 32px rgba(0, 0, 0, 0.55);
  }

  .hero p {
    margin: 16px auto 0;
    max-width: 62ch;
    font-size: clamp(14px, 1.45vw, 18px);
    line-height: 1.5;
    color: rgba(235, 240, 255, 0.72);
    text-wrap: pretty;
    text-shadow: 0 6px 20px rgba(0, 0, 0, 0.42);
  }

  .center-cta {
    align-self: center;
    justify-self: center;
  }

  .begin-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 190px;
    padding: 14px 34px;
    border-radius: 999px;
    border: 1px solid rgba(190, 208, 255, 0.48);
    background: linear-gradient(180deg, rgba(19, 28, 56, 0.46), rgba(7, 12, 28, 0.55));
    box-shadow:
      0 0 0 1px rgba(222, 232, 255, 0.16) inset,
      0 10px 30px rgba(3, 8, 25, 0.56),
      0 0 18px rgba(155, 183, 255, 0.2);
    backdrop-filter: blur(6px);
    color: rgba(246, 250, 255, 0.96);
    text-decoration: none;
    text-transform: uppercase;
    letter-spacing: 0.34em;
    font:
      600 12px/1 ui-monospace,
      SFMono-Regular,
      Menlo,
      Monaco,
      Consolas,
      monospace;
    transition:
      border-color 180ms ease,
      box-shadow 180ms ease,
      color 180ms ease,
      transform 180ms ease;
  }

  .begin-btn:hover {
    border-color: rgba(220, 232, 255, 0.76);
    color: rgba(255, 255, 255, 0.98);
    box-shadow:
      0 0 0 1px rgba(224, 236, 255, 0.32) inset,
      0 12px 34px rgba(2, 9, 27, 0.62),
      0 0 26px rgba(185, 210, 255, 0.38);
    transform: translateY(-1px);
  }

  .begin-btn:focus-visible,
  .path-item:focus-visible {
    outline: 2px solid rgba(229, 238, 255, 0.9);
    outline-offset: 4px;
  }

  .pathway {
    width: min(960px, 100%);
    margin: 0 auto;
    display: grid;
    gap: 18px;
    grid-template-columns: 1fr auto 1fr auto 1fr;
    align-items: start;
    justify-items: center;
    column-gap: clamp(10px, 2.2vw, 28px);
  }

  .cluster {
    width: 100%;
    display: grid;
    justify-items: center;
    gap: 10px;
  }

  .path-item {
    display: inline-block;
    padding: 2px 2px 6px;
    cursor: default;
    border: 0;
    background: transparent;
    text-transform: uppercase;
    letter-spacing: 0.34em;
    font:
      12px/1.2 ui-monospace,
      SFMono-Regular,
      Menlo,
      Monaco,
      Consolas,
      monospace;
    color: rgba(234, 240, 255, 0.72);
    transition: color 180ms ease;
  }

  .path-item:hover {
    color: rgba(245, 248, 255, 0.96);
    outline: none;
  }

  .node {
    width: 7px;
    aspect-ratio: 1;
    border-radius: 50%;
    background: radial-gradient(circle at 35% 35%, rgba(243, 248, 255, 0.85), rgba(214, 223, 255, 0.55));
    box-shadow: 0 0 12px rgba(185, 207, 255, 0.42);
    margin-top: 8px;
  }

  .info-box {
    border: 1px solid rgba(176, 192, 255, 0.33);
    border-radius: 14px;
    background: linear-gradient(165deg, rgba(23, 36, 72, 0.34), rgba(8, 12, 24, 0.42));
    box-shadow:
      0 10px 26px rgba(2, 8, 23, 0.42),
      0 0 0 1px rgba(230, 237, 255, 0.08) inset;
    backdrop-filter: blur(5px);
    padding: 12px 14px;
    font-size: clamp(11px, 1.1vw, 13px);
    line-height: 1.45;
    color: rgba(236, 242, 255, 0.82);
    opacity: 0.12;
    transform: translateY(4px);
    transition:
      opacity 180ms ease,
      transform 180ms ease,
      border-color 180ms ease;
  }

  .cluster:hover .path-item,
  .cluster:focus-within .path-item {
    color: rgba(245, 248, 255, 0.96);
  }

  .cluster:hover .info-box,
  .cluster:focus-within .info-box,
  .info-box:hover {
    opacity: 0.92;
    transform: translateY(0);
    border-color: rgba(205, 220, 255, 0.56);
  }

  .nav {
    display: flex;
    justify-content: center;
    gap: 12px;
    flex-wrap: wrap;
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

  .footer-line {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 28px 40px;
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    pointer-events: none;
  }

  .footer-line .left,
  .footer-line .right {
    font:
      12px/1.2 ui-monospace,
      SFMono-Regular,
      Menlo,
      Monaco,
      Consolas,
      monospace;
    letter-spacing: 0.38em;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.55);
    text-shadow: 0 2px 14px rgba(0, 0, 0, 0.65);
  }

  @media (max-width: 900px) {
    .pathway {
      gap: 14px;
    }

    .path-item {
      font-size: 11px;
      letter-spacing: 0.24em;
    }

    .footer-line {
      padding: 22px 20px;
    }

    .footer-line .left,
    .footer-line .right {
      letter-spacing: 0.25em;
      font-size: 11px;
    }
  }

  @media (max-width: 700px) {
    :global(body) {
      background-attachment: scroll;
    }

    .enter-page {
      padding-top: clamp(24px, 5vh, 42px);
      padding-bottom: 120px;
      gap: 20px;
    }

    .pathway {
      grid-template-columns: 1fr auto 1fr auto 1fr;
      gap: 10px;
      column-gap: 10px;
    }

    .node {
      width: 5px;
      margin-top: 7px;
    }

    .path-item {
      letter-spacing: 0.18em;
      font-size: 10px;
    }

    .info-box {
      opacity: 0.35;
      transform: none;
      padding: 10px 10px;
      font-size: 11px;
    }

    .footer-line {
      padding: 16px;
    }

    .footer-line .left,
    .footer-line .right {
      font-size: 10px;
      letter-spacing: 0.12em;
    }
  }
</style>
