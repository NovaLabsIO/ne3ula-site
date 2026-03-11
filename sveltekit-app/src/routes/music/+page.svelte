<svelte:head>
  <title>MUSIC — NE3ULA</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta
    name="description"
    content="Music, releases, live sets, education, services, and products from NE3ULA."
  />
</svelte:head>

<script lang="ts">
  import Footer from '$lib/components/Footer.svelte';
  import PageNav from '$lib/components/PageNav.svelte';

  const featuredReleases = [
    {
      title: '3EL1EVE 1N',
      year: '2025',
      href: 'https://on.soundcloud.com/OIDQedzMpl7aZ7PctX'
    },
    {
      title: 'LIKE THAT',
      year: '2025',
      href: 'https://on.soundcloud.com/hwoKpAxxNgVRt0pUEi'
    },
    {
      title: 'LIKE THAT {VIP}',
      year: '2026',
      href: 'https://on.soundcloud.com/JHRePt8uKfb8F2fuJA'
    }
  ];

  const liveItems = [
    {
      title: 'Twitch Live',
      links: [
        { label: 'Watch', href: 'https://www.twitch.tv/ne3ula_db' },
        { label: 'Schedule', href: 'https://www.twitch.tv/ne3ula_db/schedule' }
      ]
    },
    {
      title: 'DJ Sets / Mix Archive',
      links: [{ label: 'Open', href: 'https://www.youtube.com/@ne3ula_db' }]
    },
    {
      title: 'Next Stream',
      text: 'TBA'
    }
  ];

  const services = [
    {
      title: 'Fiverr - EDM Mix Polish',
      links: [{ label: 'Open', href: 'https://pro.fiverr.com/s/DBAAd0P' }]
    },
    {
      title: 'Future Systems',
      bullets: ['Custom tools • performance systems • workflow automations', '(Coming Soon)']
    }
  ];

  const products = [
    {
      title: 'NE3ULA Hats',
      price: '$50',
      muted: '(Coming Soon)'
    },
    {
      title: 'Sample Packs',
      muted: '(Coming Soon)'
    }
  ];

  const navItems = [
    { label: 'MYTH', href: '/myth' },
    { label: 'AXZIO', href: '/axzio' },
    { label: 'E3', href: '/engine' }
  ];
</script>

<main class="wrap">
  <div class="music-shell">
    <section class="card music-header">
      <div class="kicker">NE3ULA</div>
      <h1>MUSIC</h1>
      <p class="music-subline">Signal</p>

      <PageNav items={navItems} className="music-nav" />
    </section>

    <section class="card music-section">
      <h2>Featured Releases</h2>

      <div class="music-grid">
        {#each featuredReleases as release}
          <article class="music-item">
            <h3>{release.title}</h3>
            <p>{release.year}</p>
            <div class="music-links">
              <a class="page-btn" href={release.href} target="_blank" rel="noopener noreferrer">Listen</a>
            </div>
          </article>
        {/each}
      </div>

      <p class="music-note">
        <a class="page-btn" href="https://soundcloud.com/ne3ula" target="_blank" rel="noopener noreferrer">
          SoundCloud Home
        </a>
      </p>
    </section>

    <section class="card music-section">
      <h2>Live</h2>

      <div class="music-row">
        {#each liveItems as item}
          <article class="music-item">
            <h3>{item.title}</h3>

            {#if item.links}
              <div class="music-links">
                {#each item.links as link}
                  <a class="page-btn" href={link.href} target="_blank" rel="noopener noreferrer">
                    {link.label}
                  </a>
                {/each}
              </div>
            {/if}

            {#if item.text}
              <p>{item.text}</p>
            {/if}
          </article>
        {/each}
      </div>

      <p class="music-note">Clips (Coming Soon) · Past Streams (Coming Soon)</p>
    </section>

    <section class="card music-section">
      <h2>Education</h2>

      <article class="music-item">
        <h3>Tutorials / Production</h3>
        <div class="music-links">
          <a class="page-btn" href="https://www.youtube.com/@ne3ula_db" target="_blank" rel="noopener noreferrer">
            Open
          </a>
        </div>
        <p class="music-muted">Playlist coming soon</p>
      </article>
    </section>

    <section class="card music-section">
      <h2>Services</h2>

      <div class="music-row">
        {#each services as item}
          <article class="music-item">
            <h3>{item.title}</h3>

            {#if item.links}
              <div class="music-links">
                {#each item.links as link}
                  <a class="page-btn" href={link.href} target="_blank" rel="noopener noreferrer">
                    {link.label}
                  </a>
                {/each}
              </div>
            {/if}

            {#if item.bullets}
              <ul class="music-bullets">
                {#each item.bullets as bullet}
                  <li>{bullet}</li>
                {/each}
              </ul>
            {/if}
          </article>
        {/each}
      </div>
    </section>

    <section class="card music-section">
      <h2>Products</h2>

      <div class="music-row">
        {#each products as item}
          <article class="music-item">
            <h3>{item.title}</h3>

            {#if item.price}
              <p>{item.price}</p>
            {/if}

            {#if item.muted}
              <p class="music-muted">{item.muted}</p>
            {/if}
          </article>
        {/each}
      </div>
    </section>
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
