/*
Canonical concept intake seed for myth.
knowledge/* is the intake/mapping layer; content/* stays focused on public-facing presentation.
*/

import type { KnowledgeEntry } from './types';

export const MYTH_KNOWLEDGE: KnowledgeEntry = {
	key: 'myth',
	name: 'Myth',
	summary: 'Myth frames meaning, worldview, and identity formation inside NE3ULA.',
	concepts: ['meaning', 'worldview', 'identity', 'becoming'],
	statements: [
		{
			id: 'myth-layer-role',
			text: 'Myth is the meaning layer that gives symbolic structure to the NE3ULA system.',
			tags: ['role', 'system']
		},
		{
			id: 'myth-becoming',
			text: 'Myth helps interpret experience as an intentional process of becoming rather than static description.',
			tags: ['identity', 'becoming']
		}
	],
	metadata: {
		status: 'seed',
		source: 'local-intake'
	},
	references: [{ label: 'canonical-repo', value: 'ne3ula-knowledge' }]
};
