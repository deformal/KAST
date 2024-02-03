CREATE TABLE "accounts"."Accounts" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "email" text NOT NULL, "password" text NOT NULL, "role_id" uuid NOT NULL, PRIMARY KEY ("id") , UNIQUE ("email"));
CREATE OR REPLACE FUNCTION "accounts"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_accounts_Accounts_updated_at"
BEFORE UPDATE ON "accounts"."Accounts"
FOR EACH ROW
EXECUTE PROCEDURE "accounts"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_accounts_Accounts_updated_at" ON "accounts"."Accounts"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
