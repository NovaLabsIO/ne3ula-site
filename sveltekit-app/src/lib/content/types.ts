/*
Typed contracts for renderable site content.
These shapes describe presentation-ready copy, not canonical NE3ULA domain truth.
*/

export type ContentKey = 'myth' | 'engine' | 'axzio';

export type ContentMetadata = Record<string, string>;

export type ContentLink = {
	label: string;
	href: string;
	description?: string;
	external?: boolean;
};

export type ContentSection = {
	id: string;
	heading: string;
	body: string[];
	links?: ContentLink[];
	metadata?: ContentMetadata;
};

export type ContentPage = {
	// The page slot exposed by the website/app content layer.
	key: ContentKey;
	title: string;
	description: string;
	sections: ContentSection[];
	links?: ContentLink[];
	metadata?: ContentMetadata;
};
