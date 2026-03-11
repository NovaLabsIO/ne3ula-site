import { NE3ULA_SYSTEM } from './system';

export type Ne3ulaSystemMetadata = {
	worldName: string;
	version: string;
	primaryInterface: string;
};

export function getSystem(): Ne3ulaSystemMetadata {
	return {
		worldName: NE3ULA_SYSTEM.world.name,
		version: NE3ULA_SYSTEM.world.version,
		primaryInterface: NE3ULA_SYSTEM.interface.primary
	};
}
