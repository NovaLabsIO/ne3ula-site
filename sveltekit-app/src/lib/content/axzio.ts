/*
Public-facing AXZIO page content for the website/content layer.
AXZIO application behavior and interface logic stay separate from this curated copy.
*/

import type { ContentPage } from './types';

export const AXZIO_CONTENT: ContentPage = {
	key: 'axzio',
	title: 'AXZIO',
	description: 'AXZIO is the interface for reflection, creation, and becoming.',
	sections: [
		{
			id: 'interface-purpose',
			heading: 'Interface Purpose',
			body: [
				'AXZIO is the interface for reflection, creation, and becoming.',
				'No feeds. No performance. Just signal.'
			]
		},
		{
			id: 'core-pathways',
			heading: 'Core Pathways',
			body: [
				'Reflect: notice patterns, interrupt drift, and see yourself clearly.',
				'Create: shape music, thought, identity, and momentum.',
				'Become: move with intent and translate signal into action.'
			],
			links: [{ label: 'BEGIN', href: '/begin' }]
		},
		{
			id: 'system-role',
			heading: 'System Role',
			body: [
				'If myth is meaning and engine is execution, AXZIO is the user-facing threshold between them.',
				'It is where the system becomes navigable.'
			]
		}
	]
};
