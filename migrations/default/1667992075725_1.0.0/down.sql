
alter table "public"."product" drop constraint "product_url_key";

alter table "public"."product" drop constraint "product_facebook_id_key";

ALTER TABLE "public"."product" ALTER COLUMN "facebook_id" TYPE integer;

alter table "public"."product" rename column "location_text" to "locationText";

alter table "public"."product_photo" drop constraint "product_photo_product_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."product_photo" add column "product_id" integer
--  not null;

DROP TABLE "public"."product_photo";

DROP TABLE "public"."product";
