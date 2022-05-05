import { Request, Response } from "express";
import { prisma } from "../../../../database/prismaClient";

export default class PresencesController {
  async index(req: Request, res: Response) {
    const { search } = req.query;

    var presences = [];

    if (Number(search) > 0) {
      presences = await prisma.presence.findMany({
        where: {
          table_id: Number(search),
        },
        include: {
          table: {
            select: {
              number: true,
            },
          },
        },
      });

      if (presences.length === 0) {
        return res.status(400).json({
          message: "Mesa não encontrada!",
        });
      }
    } else {
      presences = await prisma.presence.findMany({
        where: {
          person_name: {
            contains: String(search),
            mode: "insensitive",
          },
        },
        include: {
          table: {
            select: {
              number: true,
            },
          },
        },
      });

      if (presences.length === 0) {
        return res.status(400).json({
          message: "Nome não encontrada!",
        });
      }
    }

    return res.json(presences);
  }

  async update(req: Request, res: Response) {
    const { presence_id } = req.params;

    const presence = await prisma.presence.update({
      data: {
        arrived_at: new Date(),
      },
      where: {
        id: Number(presence_id),
      },
    });

    return res.json(presence);
  }

  async delete(req: Request, res: Response) {
    const { presence_id } = req.params;

    try {
      const presence = await prisma.presence.delete({
        where: {
          id: Number(presence_id),
        },
      });

      return res.json(presence);
    } catch (error) {
      return res.status(400).json({ message: "Nome não encontrado" });
    }
  }
}
