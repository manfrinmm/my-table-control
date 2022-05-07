import { Request, Response } from "express";
import { prisma } from "../../../../database/prismaClient";

export default class TablesController {
  async index(req: Request, res: Response) {
    const { event_id } = req.params;

    const event = await prisma.event.findFirst({
      where: {
        id: Number(event_id),
      },
      include: {
        tables: {
          orderBy: {
            number: "asc",
          },
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
        },
      },
    });

    if (!event) {
      return res.status(400).json({
        message: "Evento não encontrado.",
      });
    }

    // const events = await prisma.table.findMany({
    //   where: {
    //     event_id: Number(event_id),
    //   },
    //   include: {
    //     _count: true,
    //     presences: {
    //       select: {
    //         person_name: true,
    //         type: true,
    //       },
    //       take: 1,
    //     },
    //   },
    // });

    return res.json(event.tables);
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
