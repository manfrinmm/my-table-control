import { User } from "@prisma/client";
import { hash } from "bcryptjs";
import { prisma } from "../../../database/prismaClient";
import { AppError } from "../../../errors/AppError";

interface IRequest {
  email: string;
  password: string;
}

export default class CreateUserService {
  async execute({ email, password }: IRequest): Promise<User> {
    const userAlreadyExists = await prisma.user.findFirst({
      where: {
        email,
      },
    });

    if (userAlreadyExists) {
      throw new AppError("Usuário já criado");
    }

    const passwordHash = await hash(password, 8);

    const user = await prisma.user.create({
      data: {
        email,
        password: passwordHash,
      },
    });

    return user;
  }
}
