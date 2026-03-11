/*
Identity engine concepts for profile, role, and state modeling.
This is descriptive only and can be expanded as app features become concrete.
*/

export type Ne3ulaIdentityAspect = 'self' | 'expression' | 'memory';

export type Ne3ulaIdentity = {
	engine: string;
	aspects: readonly Ne3ulaIdentityAspect[];
	adaptive: boolean;
};

export const NE3ULA_IDENTITY: Ne3ulaIdentity = {
	engine: 'identity-core',
	aspects: ['self', 'expression', 'memory'],
	adaptive: true
};
