<script lang="ts">
  import PlaceholderPage from '$lib/components/PlaceholderPage.svelte';

  const navItems = [
    { label: 'HOME', href: '/home' },
    { label: 'MUSIC', href: '/music' },
    { label: 'MYTH', href: '/myth' },
    { label: 'AXZIO', href: '/axzio' },
    { label: 'E3', current: true }
  ];
</script>

<PlaceholderPage
  title="E3"
  description="The NE3ULA E3 placeholder page."
  bodyText="Placeholder content. Replace with final experience."
  backgroundImageUrl="/assets/home/bg-home.png"
  {navItems}
/>
