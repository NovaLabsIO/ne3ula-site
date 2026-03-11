/*
Renderable engine-layer copy for the site.
Underlying system behavior and shared domain primitives belong in src/lib/ne3ula/*.
*/

import type { ContentPage } from './types';

export const ENGINE_CONTENT: ContentPage = {
	key: 'engine',
	title: 'ENGINE',
	description: 'The NE3ULA engine layer for systems, execution, and momentum.',
	sections: [
		{
			id: 'execution-core',
			heading: 'Execution Core',
			body: [
				'The engine is the operational layer behind the myth.',
				'It turns symbols and intentions into repeatable systems, loops, and outputs.'
			]
		},
		{
			id: 'composable-systems',
			heading: 'Composable Systems',
			body: [
				'This content model should support product thinking as easily as lore.',
				'Sections can later describe workflows, modules, or state transitions without introducing a different schema.'
			],
			metadata: {
				status: 'placeholder',
				orientation: 'systems'
			}
		},
		{
			id: 'future-modules',
			heading: 'Future Modules',
			body: [
				'Planned engine content can cover orchestration, identity mechanics, and generation pipelines.',
				'For now, the page exists as a typed target for future expansion.'
			]
		}
	]
};
