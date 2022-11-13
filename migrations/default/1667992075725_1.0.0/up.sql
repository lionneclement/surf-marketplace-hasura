
CREATE TABLE "public"."product" ("id" serial NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "facebook_id" integer NOT NULL, "title" text NOT NULL, "description" text NOT NULL, "url" text NOT NULL, "locationText" text NOT NULL, "latitude" numeric NOT NULL, "longitude" numeric NOT NULL, "formatted_amount" text NOT NULL, "amount" numeric NOT NULL, "currency" text NOT NULL, "user_name" text NOT NULL, "size" text, PRIMARY KEY ("id") );
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_product_updated_at"
BEFORE UPDATE ON "public"."product"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_product_updated_at" ON "public"."product" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';

CREATE TABLE "public"."product_photo" ("id" serial NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "url" text NOT NULL, PRIMARY KEY ("id") );

alter table "public"."product_photo" add column "product_id" integer
 not null;

alter table "public"."product_photo"
  add constraint "product_photo_product_id_fkey"
  foreign key ("product_id")
  references "public"."product"
  ("id") on update restrict on delete restrict;

alter table "public"."product" rename column "locationText" to "location_text";

ALTER TABLE "public"."product" ALTER COLUMN "facebook_id" TYPE numeric;

alter table "public"."product" add constraint "product_facebook_id_key" unique ("facebook_id");

alter table "public"."product" add constraint "product_url_key" unique ("url");
