/*
Content registry for renderable site pages.
This composes curated content entries without redefining NE3ULA domain/system truth.
*/

import { AXZIO_CONTENT } from './axzio';
import { ENGINE_CONTENT } from './engine';
import { MUSIC_CONTENT } from './music';
import { MYTH_CONTENT } from './myth';
import type { ContentKey, ContentPage } from './types';

export const CONTENT_PAGES: Record<ContentKey, ContentPage> = {
	myth: MYTH_CONTENT,
	engine: ENGINE_CONTENT,
	axzio: AXZIO_CONTENT,
	music: MUSIC_CONTENT
};

export function getContent(key: ContentKey): ContentPage {
	return CONTENT_PAGES[key];
}

export function getAllContent(): ContentPage[] {
	return Object.values(CONTENT_PAGES);
}
