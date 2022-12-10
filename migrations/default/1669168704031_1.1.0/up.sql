
alter table "public"."product" add column "is_sold" boolean
 not null default 'false';

alter table "public"."product" add column "is_visible" boolean
 null default 'true';

alter table "public"."product" drop column "is_visible" cascade;

alter table "public"."product" add column "sold_at" timestamptz
 null;

alter table "public"."product" alter column "location_text" drop not null;

alter table "public"."product" add column "volume" numeric
 null;

alter table "public"."product" add column "brand" text
 null;
