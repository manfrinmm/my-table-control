import { Request, Response } from "express";
import { prisma } from "../../../database/prismaClient";
import fileSystem from "fs";

type FileType = {
  name: string;
  acompanhantes: {
    name: string;
  }[];
};

export default class ImportsController {
  async store(req: Request, res: Response) {
    const file = req.file;

    if (!file) {
      return res.json("erro");
    }

    const data = JSON.parse(
      fileSystem.readFileSync(file.path).toString(),
    ) as FileType[];

    var counter = 1;

    for await (const convidado of data) {
      const acompanhantes = convidado.acompanhantes.map((acompanhante) => ({
        person_name: acompanhante.name,
        type: "Acompanhante",
      }));

      await prisma.table.create({
        data: {
          capacity: 10,
          number: counter,
          event_id: 1,
          presences: {
            createMany: {
              data: [
                { person_name: convidado.name, type: "Convidado" },
                ...acompanhantes,
              ],
            },
          },
        },
      });

      counter++;
    }

    return res.json(data);
  }
}
