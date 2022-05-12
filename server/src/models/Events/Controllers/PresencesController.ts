import { Request, Response } from "express";
import slugify from "../../../utils/slugify";
import { prisma } from "../../../database/prismaClient";

export default class PresencesController {
  async index(req: Request, res: Response) {
    const { event_id } = req.params;
    const { search } = req.query;

    if (!search) {
      return res.status(400).json({ message: "Sem parâmetro de busca" });
    }

    var presences = [];

    if (Number(search) >= 0) {
      presences = await prisma.presence.findMany({
        where: {
          table: {
            number: Number(search),
          },
        },
        orderBy: {
          arrived_at: "desc",
        },
        include: {
          table: true,
        },
      });

      if (presences.length === 0) {
        return res.status(400).json({
          message: "Mesa não encontrada ou vazia!",
        });
      }
    } else {
      presences = await prisma.presence.findMany({
        where: {
          person_slug: {
            contains: slugify(String(search)),
            mode: "insensitive",
          },
          table: {
            event_id: Number(event_id),
          },
        },
        orderBy: {
          arrived_at: "desc",
        },
        include: {
          table: true,
        },
      });

      if (presences.length === 0) {
        return res.status(400).json({
          message: "Nome não encontrado!",
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
      await prisma.presence.delete({
        where: {
          id: Number(presence_id),
        },
      });

      return res.json();
    } catch (error) {
      return res.status(400).json({ message: "Nome não encontrado" });
    }
  }
}
