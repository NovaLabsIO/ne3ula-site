/*
Interface capability map for current and planned NE3ULA surfaces.
Boolean flags keep the contract simple for application wiring.
*/

export type Ne3ulaInterfaceCapabilities = {
	web: boolean;
	axzio: boolean;
	mobile: boolean;
};

export type Ne3ulaInterface = {
	capabilities: Ne3ulaInterfaceCapabilities;
	primary: keyof Ne3ulaInterfaceCapabilities;
};

export const NE3ULA_INTERFACE: Ne3ulaInterface = {
	capabilities: {
		web: true,
		axzio: true,
		mobile: false
	},
	primary: 'web'
};
