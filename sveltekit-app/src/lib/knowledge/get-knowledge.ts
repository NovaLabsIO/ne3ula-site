/*
Helper accessors for the canonical knowledge intake/mapping layer.
Use knowledge/* for source-aligned entries and content/* for curated public-facing website content.
*/

import { AXZIO_KNOWLEDGE } from './axzio';
import { ENGINE_KNOWLEDGE } from './engine';
import { MYTH_KNOWLEDGE } from './myth';
import type { KnowledgeEntry, KnowledgeKey } from './types';

const KNOWLEDGE_ENTRIES: Record<KnowledgeKey, KnowledgeEntry> = {
	myth: MYTH_KNOWLEDGE,
	engine: ENGINE_KNOWLEDGE,
	axzio: AXZIO_KNOWLEDGE
};

export function getKnowledge(key: KnowledgeKey): KnowledgeEntry {
	return KNOWLEDGE_ENTRIES[key];
}

export function getAllKnowledge(): KnowledgeEntry[] {
	return Object.values(KNOWLEDGE_ENTRIES);
}

export function isKnowledgeKey(value: string): value is KnowledgeKey {
	return value in KNOWLEDGE_ENTRIES;
}
