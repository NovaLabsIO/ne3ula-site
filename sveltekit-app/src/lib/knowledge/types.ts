/*
Typed contracts for the canonical knowledge intake/mapping layer.
knowledge/* models source-aligned concepts, while content/* remains curated public-facing website content.
*/

export type KnowledgeKey = 'myth' | 'engine' | 'axzio';

export type KnowledgeMetadata = Record<string, string>;

export type KnowledgeReference = {
	label: string;
	value: string;
};

export type KnowledgeStatement = {
	id: string;
	text: string;
	tags?: string[];
};

export type KnowledgeEntry = {
	key: KnowledgeKey;
	name: string;
	summary: string;
	concepts: string[];
	statements: KnowledgeStatement[];
	metadata?: KnowledgeMetadata;
	references?: KnowledgeReference[];
};
