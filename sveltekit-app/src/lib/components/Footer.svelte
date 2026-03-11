<script lang="ts">
  type FooterVariant = 'default' | 'compact' | 'mono';

  let { variant = 'default' }: { variant?: FooterVariant } = $props();
</script>

<footer class={variant === 'default' ? 'site-footer' : `site-footer site-footer--${variant}`}>
  <span>© NE3ULA</span>
  <span>LIVE YOUR LEGEND</span>
</footer>
