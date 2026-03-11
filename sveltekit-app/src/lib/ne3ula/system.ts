/*
NE3ULA system kernel.
Central registry for the lightweight application architecture.
*/

import { NE3ULA_IDENTITY, type Ne3ulaIdentity } from './identity';
import { NE3ULA_INTERFACE, type Ne3ulaInterface } from './interface';
import { NE3ULA_MYTH, type Ne3ulaMyth } from './myth';
import { NE3ULA_WORLD, type Ne3ulaWorld } from './world';

export type Ne3ulaSystem = {
	world: Ne3ulaWorld;
	myth: Ne3ulaMyth;
	identity: Ne3ulaIdentity;
	interface: Ne3ulaInterface;
};

export const NE3ULA_SYSTEM: Ne3ulaSystem = {
	world: NE3ULA_WORLD,
	myth: NE3ULA_MYTH,
	identity: NE3ULA_IDENTITY,
	interface: NE3ULA_INTERFACE
};
