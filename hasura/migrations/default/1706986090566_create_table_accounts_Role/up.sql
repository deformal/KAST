CREATE TABLE "accounts"."Role" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL DEFAULT 'DEV', PRIMARY KEY ("id") , UNIQUE ("name"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
