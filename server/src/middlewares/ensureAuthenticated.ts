import { prisma } from "../database/prismaClient";
import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";
import { AppError } from "../errors/AppError";

export async function ensureAuthenticated(
  request: Request,
  response: Response,
  next: NextFunction,
) {
  const { authorization } = request.headers;

  if (!authorization) {
    throw new AppError("Token is required", 401);
  }

  const [, token] = authorization.split(" ");

  try {
    const { sub: user_id } = verify(
      token,
      process.env.SECRET_KEY || "SECRET_KEY",
    );

    const user = await prisma.user.findFirst({
      where: {
        id: String(user_id),
      },
    });

    if (!user) {
      throw new AppError("Usuário não encontrado", 401);
    }

    request.user = {
      id: String(user_id),
    };

    next();
  } catch (error) {
    throw new AppError("Token inválido", 401);
  }
}
