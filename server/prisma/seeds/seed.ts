import { PrismaClient } from "@prisma/client";
import { hash } from "bcryptjs";

const prisma = new PrismaClient();

async function main() {
  const password = await hash("123456", 8);

  await prisma.user.create({
    data: {
      email: "user@mail.com",
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
      tables_quantity: 200,
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
