import { Request, Response } from "express";
import { prisma } from "../../../database/prismaClient";

export default class EventsController {
  async index(req: Request, res: Response) {
    const events = await prisma.event.findMany();

    return res.json(events);
  }

  async store(req: Request, res: Response) {
    const { name, state, city, local, when } = req.body;

    const event = await prisma.event.create({
      data: {
        name,
        state,
        city,
        local,
        when,
      },
    });

    return res.status(201).json(event);
  }
}
