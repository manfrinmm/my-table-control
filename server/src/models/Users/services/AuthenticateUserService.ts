import { compare } from "bcryptjs";
import { sign } from "jsonwebtoken";

import { prisma } from "../../../../database/prismaClient";
import { AppError } from "../../../errors/AppError";

interface IRequest {
  email: string;
  password: string;
}

interface IResponse {
  token: string;
  user: {
    name: string;
    email: string;
  };
}

export default class AuthenticateUserService {
  async execute({ email, password }: IRequest): Promise<IResponse> {
    const user = await prisma.user.findFirst({
      where: {
        email,
      },
    });

    if (!user) {
      throw new AppError("E-mail ou senha incorreto", 401);
    }

    const passwordMatch = await compare(password, user.password);

    if (!passwordMatch) {
      throw new AppError("E-mail or senha incorreto", 401);
    }

    const token = sign({}, process.env.SECRET_KEY || "SECRET_KEY", {
      subject: user.id,
      expiresIn: process.env.EXPIRES_IN || "1d",
    });

    return {
      user: {
        name: user.name,
        email: user.email,
      },
      token,
    };
  }
}
