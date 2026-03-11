/*
World metadata for the NE3ULA application domain.
This stays intentionally small so it can anchor the rest of the system.
*/

export type Ne3ulaWorld = {
	name: string;
	version: string;
	domain: string;
	status: 'prototype' | 'active' | 'archived';
};

export const NE3ULA_WORLD: Ne3ulaWorld = {
	name: 'NE3ULAVERSE',
	version: '0.1.0',
	domain: 'ne3ula',
	status: 'prototype'
};
