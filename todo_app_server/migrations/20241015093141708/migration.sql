BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "todo" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "isCompleted" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR todo_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todo_app', '20241015093141708', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241015093141708', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
