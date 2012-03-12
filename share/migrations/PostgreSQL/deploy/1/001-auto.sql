-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Fri Mar  9 12:02:32 2012
-- 
;
--
-- Table: account
--
CREATE TABLE "account" (
  "account_id" serial NOT NULL,
  "password" character(40) NOT NULL,
  "email" character varying(96) NOT NULL,
  PRIMARY KEY ("account_id"),
  CONSTRAINT "account_email" UNIQUE ("email")
);

;
--
-- Table: license
--
CREATE TABLE "license" (
  "license_id" serial NOT NULL,
  "title" character varying(64) NOT NULL,
  PRIMARY KEY ("license_id"),
  CONSTRAINT "license_title" UNIQUE ("title")
);

;
--
-- Table: contributor
--
CREATE TABLE "contributor" (
  "contributor_id" serial NOT NULL,
  "account_id" integer NOT NULL,
  "proper_name" character varying(96) NOT NULL,
  PRIMARY KEY ("contributor_id")
);
CREATE INDEX "contributor_idx_account_id" on "contributor" ("account_id");

;
--
-- Table: member
--
CREATE TABLE "member" (
  "member_id" serial NOT NULL,
  "account_id" integer NOT NULL,
  PRIMARY KEY ("member_id")
);
CREATE INDEX "member_idx_account_id" on "member" ("account_id");

;
--
-- Table: image
--
CREATE TABLE "image" (
  "image_id" serial NOT NULL,
  "contributor_id" integer NOT NULL,
  "license_id" integer NOT NULL,
  "title" character varying(64) NOT NULL,
  "description" text NOT NULL,
  "non_opened_license_url" character varying(256),
  "file" character varying NOT NULL,
  PRIMARY KEY ("image_id")
);
CREATE INDEX "image_idx_contributor_id" on "image" ("contributor_id");
CREATE INDEX "image_idx_license_id" on "image" ("license_id");

;
--
-- Table: download
--
CREATE TABLE "download" (
  "member_id" integer NOT NULL,
  "image_id" integer NOT NULL,
  "downloaded_on" timestamp NOT NULL,
  PRIMARY KEY ("member_id", "image_id")
);
CREATE INDEX "download_idx_image_id" on "download" ("image_id");
CREATE INDEX "download_idx_member_id" on "download" ("member_id");

;
--
-- Foreign Key Definitions
--

;
ALTER TABLE "contributor" ADD FOREIGN KEY ("account_id")
  REFERENCES "account" ("account_id") ON DELETE CASCADE DEFERRABLE;

;
ALTER TABLE "member" ADD FOREIGN KEY ("account_id")
  REFERENCES "account" ("account_id") ON DELETE CASCADE DEFERRABLE;

;
ALTER TABLE "image" ADD FOREIGN KEY ("contributor_id")
  REFERENCES "contributor" ("contributor_id") ON DELETE CASCADE DEFERRABLE;

;
ALTER TABLE "image" ADD FOREIGN KEY ("license_id")
  REFERENCES "license" ("license_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

;
ALTER TABLE "download" ADD FOREIGN KEY ("image_id")
  REFERENCES "image" ("image_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

;
ALTER TABLE "download" ADD FOREIGN KEY ("member_id")
  REFERENCES "member" ("member_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

