/*
Canonical concept intake seed for engine.
knowledge/* captures domain concepts locally; content/* remains curated website copy.
*/

import type { KnowledgeEntry } from './types';

export const ENGINE_KNOWLEDGE: KnowledgeEntry = {
	key: 'engine',
	name: 'Engine',
	summary: 'Engine represents execution, systems, and operational momentum within NE3ULA.',
	concepts: ['execution', 'systems', 'operations', 'momentum'],
	statements: [
		{
			id: 'engine-layer-role',
			text: 'Engine is the execution layer that turns symbolic intent into repeatable systems and outputs.',
			tags: ['role', 'execution']
		},
		{
			id: 'engine-composability',
			text: 'Engine concepts should remain composable so workflows, modules, and orchestration can share one model.',
			tags: ['systems', 'composition']
		}
	],
	metadata: {
		status: 'seed',
		source: 'local-intake'
	},
	references: [{ label: 'canonical-repo', value: 'ne3ula-knowledge' }]
};
