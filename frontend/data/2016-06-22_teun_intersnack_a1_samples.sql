SET standard_conforming_strings = OFF;
DROP TABLE "public"."2016_06_22_teun_intersnack_a1_samples" CASCADE;
DELETE FROM geometry_columns WHERE f_table_name = '2016_06_22_teun_intersnack_a1_samples' AND f_table_schema = 'public';
BEGIN;
CREATE TABLE "public"."2016_06_22_teun_intersnack_a1_samples" ( OGC_FID SERIAL, CONSTRAINT "2016_06_22_teun_intersnack_a1_samples_pk" PRIMARY KEY (OGC_FID) );
SELECT AddGeometryColumn('public','2016_06_22_teun_intersnack_a1_samples','wkb_geometry',32631,'POINT',2);
CREATE INDEX "2016_06_22_teun_intersnack_a1_samples_wkb_geometry_geom_idx" ON "public"."2016_06_22_teun_intersnack_a1_samples" USING GIST ("wkb_geometry");
ALTER TABLE "public"."2016_06_22_teun_intersnack_a1_samples" ADD COLUMN "zone_id" FLOAT8;
ALTER TABLE "public"."2016_06_22_teun_intersnack_a1_samples" ADD COLUMN "id" FLOAT8;
ALTER TABLE "public"."2016_06_22_teun_intersnack_a1_samples" ADD COLUMN "sample_num" FLOAT8;
ALTER TABLE "public"."2016_06_22_teun_intersnack_a1_samples" ADD COLUMN "method" VARCHAR;
ALTER TABLE "public"."2016_06_22_teun_intersnack_a1_samples" ADD COLUMN "notes" VARCHAR;
ALTER TABLE "public"."2016_06_22_teun_intersnack_a1_samples" ADD COLUMN "name" VARCHAR;
INSERT INTO "public"."2016_06_22_teun_intersnack_a1_samples" ("wkb_geometry" , "OGC_FID" , "zone_id", "id", "sample_num", "method", "notes", "name") VALUES ('0101000020777F000061376CCB21581441C269C16A269A5541', 1 , 3, 1, 3, 'random', '', '1');
COMMIT;
