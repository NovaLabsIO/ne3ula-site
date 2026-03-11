<script lang="ts">
  import PlaceholderPage from '$lib/components/PlaceholderPage.svelte';

  const navItems = [
    { label: 'HOME', href: '/home' },
    { label: 'MUSIC', href: '/music' },
    { label: 'LORE', current: true },
    { label: 'AXZIO', href: '/axzio' },
    { label: 'E3', href: '/e3' }
  ];
</script>

<PlaceholderPage
  title="LORE"
  description="The NE3ULA lore placeholder page."
  bodyText="Placeholder content. Replace with final experience."
  {navItems}
/>
