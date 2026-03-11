/*
Symbolic structure for the NE3ULA myth layer.
These values define the narrative model without adding runtime complexity.
*/

export type Ne3ulaPillar = 'Body' | 'Mind' | 'Heart' | 'Spirit';

export type Ne3ulaLayer = 'Myth' | 'Identity' | 'Engine' | 'Interface';

export type Ne3ulaMyth = {
	pillars: readonly Ne3ulaPillar[];
	layers: readonly Ne3ulaLayer[];
	coreSymbol: string;
};

export const NE3ULA_MYTH: Ne3ulaMyth = {
	pillars: ['Body', 'Mind', 'Heart', 'Spirit'],
	layers: ['Myth', 'Identity', 'Engine', 'Interface'],
	coreSymbol: 'NE3ULA'
};
