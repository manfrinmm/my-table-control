import { Request, Response } from "express";
import { prisma } from "../../../database/prismaClient";
import fileSystem from "fs";
import { parse as csvParse } from "csv-parse";

type PersonType = {
  person_name: string;
  type: string;
};

function loadNames(path: string): Promise<any[]> {
  return new Promise((resolve, reject) => {
    const stream = fileSystem.createReadStream(path);
    const parseFile = csvParse({
      delimiter: ";",
      from_line: 2,
    });

    const data: any = [];

    stream.pipe(parseFile);

    parseFile
      .on("data", async (line) => {
        const [number, capacity, convidado, acompanhante] = line;

        data.push({ number, capacity, convidado, acompanhante });
      })
      .on("end", async () => {
        resolve(data);
      })
      .on("error", (err) => {
        reject(err);
      });
  });
}

export default class ImportsController {
  async store(req: Request, res: Response) {
    const file = req.file;

    if (!file) {
      return res.json("sem arquivo na req");
    }

    var data = await loadNames(file.path);

    var groupBy = function (xs: any, key: any): Object {
      return xs.reduce(function (rv: any, x: any) {
        (rv[x[key]] = rv[x[key]] || []).push(x);
        return rv;
      }, {});
    };

    data = Object.entries(groupBy(data, "number"));

    const formattedData = data.map((mesa) => {
      const number = Number(mesa[0]);
      const capacity = Number(mesa[1][0].capacity);
      const convidados = [] as PersonType[];

      const acompanhantes = mesa[1].map((person: any) => {
        const convidadoAlreadyAdded = convidados.some(
          (convidado) => convidado.person_name === person.convidado,
        );

        if (!convidadoAlreadyAdded) {
          convidados.push({ person_name: person.convidado, type: "Convidado" });
        }

        return {
          person_name: person.acompanhante,
          type: "Acompanhante",
        };
      });

      return {
        number,
        capacity,
        persons: [...convidados, ...acompanhantes],
      };
    });

    for await (const mesa of formattedData) {
      await prisma.table.create({
        data: {
          capacity: mesa.capacity,
          number: mesa.number,
          event_id: 1,
          presences: {
            createMany: {
              data: mesa.persons,
            },
          },
        },
      });
    }

    return res.json({ message: "dados cadastrados" });
  }
}
