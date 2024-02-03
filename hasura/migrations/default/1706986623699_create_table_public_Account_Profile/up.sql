CREATE TABLE "public"."Account_Profile" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "account_id" uuid NOT NULL, "username" text NOT NULL, "email" text NOT NULL, "public_ip" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("account_id") REFERENCES "accounts"."Accounts"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("email"), UNIQUE ("public_ip"));
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
CREATE TRIGGER "set_public_Account_Profile_updated_at"
BEFORE UPDATE ON "public"."Account_Profile"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_Account_Profile_updated_at" ON "public"."Account_Profile"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
