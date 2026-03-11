/*
Canonical concept intake seed for AXZIO.
knowledge/* preserves source-aligned concepts; content/* stays as public-facing site content.
*/

import type { KnowledgeEntry } from './types';

export const AXZIO_KNOWLEDGE: KnowledgeEntry = {
	key: 'axzio',
	name: 'AXZIO',
	summary: 'AXZIO is the interface layer that makes reflection, creation, and navigation actionable.',
	concepts: ['interface', 'reflection', 'creation', 'navigation'],
	statements: [
		{
			id: 'axzio-layer-role',
			text: 'AXZIO is the interface threshold where users encounter and navigate the broader NE3ULA system.',
			tags: ['role', 'interface']
		},
		{
			id: 'axzio-pathways',
			text: 'AXZIO should support reflective, creative, and directional pathways without collapsing them into marketing copy.',
			tags: ['pathways', 'product']
		}
	],
	metadata: {
		status: 'seed',
		source: 'local-intake'
	},
	references: [{ label: 'canonical-repo', value: 'ne3ula-knowledge' }]
};
