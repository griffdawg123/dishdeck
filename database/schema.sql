DROP TABLE "users" CASCADE;
DROP TABLE "recipes" CASCADE;
DROP TABLE "uses" CASCADE;
DROP TABLE "ingredients" CASCADE;

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "created_at" timestamp
);

CREATE TABLE "recipes" (
  "id" integer PRIMARY KEY,
  "owner" integer,
  "private" bool,
  "name" varchar,
  "created_at" timestamp,
  "ingredients" text,
  "method" text,
  "likes" integer
);

CREATE TABLE "uses" (
  "recipeId" integer,
  "ingredientId" integer
);

CREATE TABLE "ingredients" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("owner") REFERENCES "users" ("id");

ALTER TABLE "uses" ADD FOREIGN KEY ("recipeId") REFERENCES "recipes" ("id");

ALTER TABLE "uses" ADD FOREIGN KEY ("ingredientId") REFERENCES "ingredients" ("id");
