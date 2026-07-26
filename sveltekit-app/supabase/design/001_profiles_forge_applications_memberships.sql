-- DESIGN DRAFT ONLY — NOT A MIGRATION. Do not apply without Phase 2B/2C approval.
-- Adds new Forge tables only; does not alter observed AXZIO tables.

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text,
  display_name text,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint profiles_username_format_check
    check (username is null or username ~ '^[a-z0-9_]{3,30}$')
);

-- Lowercase-only validation enforces normalization. The partial index permits
-- multiple null usernames while enforcing case-insensitive uniqueness otherwise.
create unique index profiles_username_lower_unique
  on public.profiles (lower(username))
  where username is not null;

create table public.forge_applications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  intent text,
  application_data jsonb not null default '{}'::jsonb,
  schema_version integer not null default 1,
  submitted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint forge_applications_data_object_check
    check (jsonb_typeof(application_data) = 'object'),
  constraint forge_applications_schema_version_check
    check (schema_version > 0),
  -- Proposed 2,000-character intent limit; requires product approval.
  constraint forge_applications_intent_length_check
    check (intent is null or char_length(intent) <= 2000),
  -- Proposed 64 KiB serialized JSON limit; requires product/privacy approval.
  constraint forge_applications_data_size_check
    check (octet_length(application_data::text) <= 65536)
);

create table public.forge_memberships (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  status text not null default 'pending'
    constraint forge_memberships_status_check
      check (status in ('pending', 'active', 'paused', 'declined')),
  contribution_role text,
  forge_path text,
  joined_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Profiles are initially created through an authenticated application/server
-- onboarding flow. No auth.users trigger is proposed; any automatic profile
-- creation requires separate security and operational review.
