import { PrismaClient } from "@prisma/client";
import { hash } from "bcryptjs";

const prisma = new PrismaClient();

async function main() {
  const password = await hash("130522", 8);

  await prisma.user.create({
    data: {
      email: "jatoba",
      password,
    },
  });

  await prisma.event.create({
    data: {
      city: "Jataí",
      local: "Pecuária",
      name: "evento",
      state: "GO",
      when: new Date().toISOString(),
    },
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
