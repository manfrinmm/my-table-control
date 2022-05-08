import { Request, Response } from "express";
import { prisma } from "../../../database/prismaClient";

export default class EventsController {
  async index(req: Request, res: Response) {
    const events = await prisma.event.findMany();

    return res.json(events);
  }

  async store(req: Request, res: Response) {
    const { name, state, city, local, when, tables_quantity, tables_capacity } =
      req.body;

    const tables = new Array(tables_quantity).fill({}).map((_, index) => ({
      capacity: tables_capacity,
      number: index + 1,
    }));

    const event = await prisma.event.create({
      data: {
        name,
        state,
        city,
        local,
        when,
        tables_quantity,
        tables: {
          createMany: {
            data: tables,
          },
        },
      },
    });

    return res.status(201).json(event);
  }
}
