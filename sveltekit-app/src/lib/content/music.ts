/*
Renderable music page content for the website/content layer.
Artist systems and canonical NE3ULA domain truth stay in src/lib/ne3ula/*.
*/

import type { ContentPage } from './types';

export const MUSIC_CONTENT: ContentPage = {
	key: 'music',
	title: 'MUSIC',
	description: 'Music, releases, live sets, education, services, and products from NE3ULA.',
	metadata: {
		subline: 'Signal'
	},
	sections: [
		{
			id: 'featured-releases',
			heading: 'Featured Releases',
			body: [],
			items: [
				{
					title: '3EL1EVE 1N',
					metadata: {
						year: '2025'
					},
					links: [
						{
							label: 'Listen',
							href: 'https://on.soundcloud.com/OIDQedzMpl7aZ7PctX',
							external: true
						}
					]
				},
				{
					title: 'LIKE THAT',
					metadata: {
						year: '2025'
					},
					links: [
						{
							label: 'Listen',
							href: 'https://on.soundcloud.com/hwoKpAxxNgVRt0pUEi',
							external: true
						}
					]
				},
				{
					title: 'LIKE THAT {VIP}',
					metadata: {
						year: '2026'
					},
					links: [
						{
							label: 'Listen',
							href: 'https://on.soundcloud.com/JHRePt8uKfb8F2fuJA',
							external: true
						}
					]
				}
			],
			links: [
				{
					label: 'SoundCloud Home',
					href: 'https://soundcloud.com/ne3ula',
					external: true
				}
			]
		},
		{
			id: 'live',
			heading: 'Live',
			items: [
				{
					title: 'Twitch Live',
					links: [
						{
							label: 'Watch',
							href: 'https://www.twitch.tv/ne3ula_db',
							external: true
						},
						{
							label: 'Schedule',
							href: 'https://www.twitch.tv/ne3ula_db/schedule',
							external: true
						}
					]
				},
				{
					title: 'DJ Sets / Mix Archive',
					links: [
						{
							label: 'Open',
							href: 'https://www.youtube.com/@ne3ula_db',
							external: true
						}
					]
				},
				{
					title: 'Next Stream',
					body: ['TBA']
				}
			],
			body: ['Clips (Coming Soon) · Past Streams (Coming Soon)']
		},
		{
			id: 'education',
			heading: 'Education',
			body: [],
			items: [
				{
					title: 'Tutorials / Production',
					links: [
						{
							label: 'Open',
							href: 'https://www.youtube.com/@ne3ula_db',
							external: true
						}
					],
					body: ['Playlist coming soon'],
					metadata: {
						tone: 'muted'
					}
				}
			]
		},
		{
			id: 'services',
			heading: 'Services',
			body: [],
			items: [
				{
					title: 'Fiverr - EDM Mix Polish',
					links: [
						{
							label: 'Open',
							href: 'https://pro.fiverr.com/s/DBAAd0P',
							external: true
						}
					]
				},
				{
					title: 'Future Systems',
					body: ['Custom tools • performance systems • workflow automations', '(Coming Soon)'],
					metadata: {
						format: 'bullets'
					}
				}
			]
		},
		{
			id: 'products',
			heading: 'Products',
			body: [],
			items: [
				{
					title: 'NE3ULA Hats',
					body: ['$50'],
					metadata: {
						muted: '(Coming Soon)'
					}
				},
				{
					title: 'Sample Packs',
					metadata: {
						muted: '(Coming Soon)'
					}
				}
			]
		}
	]
};
