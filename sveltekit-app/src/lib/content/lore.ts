/*
Dormant lore module reserved for future ontology work.
Lore is intentionally excluded from the active public content model until the myth/lore boundary is finalized.
*/

export const LORE_CONTENT = {
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
} as const;
