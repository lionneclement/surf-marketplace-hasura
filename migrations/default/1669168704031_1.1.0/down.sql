
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."product" add column "brand" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."product" add column "volume" numeric
--  null;

alter table "public"."product" alter column "location_text" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."product" add column "sold_at" timestamptz
--  null;

alter table "public"."product" alter column "is_visible" set default true;
alter table "public"."product" alter column "is_visible" drop not null;
alter table "public"."product" add column "is_visible" bool;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."product" add column "is_visible" boolean
--  null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."product" add column "is_sold" boolean
--  not null default 'false';
