import { readable } from 'svelte/store';

import { NE3ULA_SYSTEM, type Ne3ulaSystem } from './system';

export const ne3ulaSystem = readable<Ne3ulaSystem>(NE3ULA_SYSTEM);
