/*
  Warnings:

  - You are about to drop the column `person_id` on the `presences` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `tables` table. All the data in the column will be lost.
  - You are about to drop the `persons` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `person_name` to the `presences` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "presences" DROP CONSTRAINT "presences_person_id_fkey";

-- AlterTable
ALTER TABLE "presences" DROP COLUMN "person_id",
ADD COLUMN     "person_name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "tables" DROP COLUMN "name";

-- DropTable
DROP TABLE "persons";
