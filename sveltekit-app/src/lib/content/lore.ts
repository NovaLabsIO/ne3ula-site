/*
Renderable lore copy for the site experience.
It presents selected worldbuilding signals rather than the full system knowledge source.
*/

import type { ContentPage } from './types';

export const LORE_CONTENT: ContentPage = {
	key: 'lore',
	title: 'LORE',
	description: 'A lightweight lore layer for the NE3ULA world, signals, and symbols.',
	sections: [
		{
			id: 'world-state',
			heading: 'World State',
			body: [
				'Lore gives the NE3ULA space memory.',
				'It captures the symbols, rules, and recurring forces that make the world feel coherent over time.'
			]
		},
		{
			id: 'signal-library',
			heading: 'Signal Library',
			body: [
				'This layer can hold factions, locations, motifs, rituals, and fragments of history.',
				'The structure stays simple so the site can grow page by page without changing the model.'
			],
			metadata: {
				status: 'seed',
				scope: 'worldbuilding'
			}
		},
		{
			id: 'next-expansion',
			heading: 'Next Expansion',
			body: [
				'The first version is intentionally small.',
				'Later entries can add timelines, entities, or relationships while still rendering from the same content contract.'
			]
		}
	]
};
