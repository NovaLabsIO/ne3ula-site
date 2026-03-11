/*
Public exports for the canonical knowledge intake/mapping layer.
knowledge/* is distinct from content/*, which remains the curated public-facing content layer.
*/

export { AXZIO_KNOWLEDGE } from './axzio';
export { ENGINE_KNOWLEDGE } from './engine';
export { getAllKnowledge, getKnowledge, isKnowledgeKey } from './get-knowledge';
export { MYTH_KNOWLEDGE } from './myth';
export type {
	KnowledgeEntry,
	KnowledgeKey,
	KnowledgeMetadata,
	KnowledgeReference,
	KnowledgeStatement
} from './types';
