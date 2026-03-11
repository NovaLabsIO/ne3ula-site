<script lang="ts">
  type NavItem = {
    label: string;
    href?: string;
    current?: boolean;
    external?: boolean;
  };

  let {
    items,
    className = ''
  }: {
    items: NavItem[];
    className?: string;
  } = $props();
</script>

<div class={`page-nav ${className}`.trim()}>
  {#each items as item}
    {#if item.current}
      <span class="page-btn page-btn-current" aria-current="page">{item.label}</span>
    {:else}
      <a
        class="page-btn"
        href={item.href}
        target={item.external ? '_blank' : undefined}
        rel={item.external ? 'noopener noreferrer' : undefined}
      >
        {item.label}
      </a>
    {/if}
  {/each}
</div>
