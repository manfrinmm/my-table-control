import { Request, Response } from "express";
import { prisma } from "../../../../database/prismaClient";

export default class TablesController {
  async index(req: Request, res: Response) {
    const events = await prisma.table.findMany({
      include: {
        _count: true,
        presences: {
          select: {
            person_name: true,
            type: true,
          },
          take: 1,
        },
      },
    });

    return res.json(events);
  }

  async store(req: Request, res: Response) {
    const { names } = req.body;
    const { table_id } = req.params;

    const presenceToRegister = names.map((name: string, index: number) => ({
      person_name: name,
      type: index === 0 ? "Convidado" : "Acompanhante",
      table_id: Number(table_id),
    }));

    const presences = await prisma.presence.createMany({
      data: presenceToRegister,
    });

    return res.status(201).json(presences);
  }

  async show(req: Request, res: Response) {
    const { table_id } = req.params;

    const table = await prisma.table.findFirst({
      where: {
        id: Number(table_id),
      },
      include: {
        presences: true,
      },
    });

    if (!table) {
      return res.status(400).json({ message: "Mesa não encontrada!" });
    }

    return res.json(table);
  }

  async update(req: Request, res: Response) {
    const { names } = req.body;
    const { table_id } = req.params;

    const presenceToRegister = names.map((name: string, index: number) => ({
      person_name: name,
      type: index === 0 ? "Convidado" : "Acompanhante",
      table_id: Number(table_id),
    }));

    const presences = await prisma.presence.createMany({
      data: presenceToRegister,
    });

    return res.status(201).json(presences);
  }
}
