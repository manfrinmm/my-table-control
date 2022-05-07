import "express-async-errors";
import express, { NextFunction, Request, Response } from "express";
import cors from "cors";

import { AppError } from "./errors/AppError";
import routes from "./routes";
import { PrismaClientKnownRequestError } from "@prisma/client/runtime";

const server = express();

const PORT = process.env.PORT || 3333;

server.use(express.json());
server.use(cors());
server.use(routes);

server.use(
  (err: Error, request: Request, response: Response, next: NextFunction) => {
    if (err instanceof AppError) {
      return response.status(err.statusCode).json({ message: err.message });
    }

    console.log(err);

    if (err instanceof PrismaClientKnownRequestError) {
      return response.status(400).json({
        status: err.code,
        message: `Prisma error. ${err.meta?.cause}`,
      });
    }

    return response.status(500).json({
      status: "error",
      message: `Internal server error - ${err.message}`,
    });
  },
);

server.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
