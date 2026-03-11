<script lang="ts">
  import { browser } from '$app/environment';

  if (browser) {
    $effect(() => {
      document.body.classList.add('splash-page');

      return () => {
        document.body.classList.remove('splash-page');
      };
    });
  }
</script>

<svelte:head>
  <title>NE3ULA</title>
  <meta name="description" content="Enter NE3ULA." />
</svelte:head>

<div class="stage"></div>

<main class="wrap">
  <div class="cta-stack">
    <div class="tagline">LIVE YOUR LEGEND</div>
    <a href="/home">ENTER</a>
  </div>
</main>

<style>
  :global(html, body) {
    height: 100%;
    margin: 0;
  }

  :global(body.splash-page) {
    background: #000;
    color: #fff;
    overflow: hidden;
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

  .stage {
    position: fixed;
    inset: 0;
    background: url('/assets/nebula-mark.png') center center / contain no-repeat;
    opacity: 1;
    z-index: 0;
    pointer-events: none;
  }

  .wrap {
    position: fixed;
    inset: 0;
    z-index: 2;
    display: grid;
    place-items: end center;
    padding-bottom: 8vh;
  }

  .cta-stack {
    position: fixed;
    left: 50%;
    bottom: 8vh;
    transform: translateX(-50%);
    z-index: 5;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1.2vh;
  }

  .tagline {
    font: 11px/1.4 ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
    letter-spacing: 0.38em;
    opacity: 0.5;
    text-transform: uppercase;
    margin-top: 0.6vh;
  }

  a {
    display: inline-block;
    text-decoration: none;
    padding: 14px 26px;
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 14px;
    background: rgba(0, 0, 0, 0.35);
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    letter-spacing: 0.32em;
    color: #fff;
  }
</style>
