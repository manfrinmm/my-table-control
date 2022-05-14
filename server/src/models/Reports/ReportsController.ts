import { Request, Response } from "express";
import path from "path";
import fileSystem from "fs";
import { prisma } from "../../database/prismaClient";

import pdfPrinter from "pdfmake";
import { TDocumentDefinitions } from "pdfmake/interfaces";

export default class ReportsController {
  async store(req: Request, res: Response) {
    const { order } = req.query;

    var fonts = {
      Helvetica: {
        normal: "Helvetica",
        bold: "Helvetica-Bold",
        italics: "Helvetica-Oblique",
        bolditalics: "Helvetica-BoldOblique",
      },
    };

    const printer = new pdfPrinter(fonts);

    const tmpFolder = path.resolve(__dirname, "..", "..", "..", "tmp");

    const presences = await prisma.presence.findMany({
      orderBy: {
        ...(order === "name"
          ? {
              person_name: "asc",
            }
          : {
              table: {
                number: "asc",
              },
            }),
      },
      select: {
        person_name: true,
        arrived_at: true,
        created_at: true,
        table: {
          select: {
            number: true,
          },
        },
      },
    });

    // Quantidade de pessoas que foram
    var arrivedPersons = 0;

    // Qtd de pessoas cadastradas no evento
    var createdPersons = 0;

    // Qtd de pessoas cadastradas no evento
    var arrivedAverage: any = 0;

    presences.forEach((presence) => {
      if (presence.arrived_at) {
        arrivedPersons++;

        arrivedAverage += presence.arrived_at.getTime();
      }

      const startHourEvent = new Date("2022-05-13 20:00");

      if (startHourEvent < presence.created_at) {
        createdPersons++;
      }
    });
    console.log("Hora media: " + new Date(arrivedAverage / arrivedPersons));

    const padding = 6;
    const pdfContent: TDocumentDefinitions = {
      content: [
        {
          text: "Relatório de Presenças",
          alignment: "center",
          bold: true,
          fontSize: 18,
          margin: [0, 0, 0, 20],
        },
        {
          text: [
            "Total de convidados e acompanhantes: ",
            {
              text: String(presences.length),
              bold: true,
            },
          ],
          margin: [0, 0, 0, 10],
        },
        {
          text: [
            "Quantidade de pessoas cadastradas na recepção: ",
            {
              text: String(createdPersons),
              bold: true,
            },
          ],
          margin: [0, 0, 0, 10],
        },
        {
          text: [
            "Presenças confirmadas: ",
            {
              text: String(arrivedPersons),
              bold: true,
            },
          ],
          margin: [0, 0, 0, 10],
        },
        {
          text: [
            "Hora média de chegada: ",
            {
              text: String(
                new Date(arrivedAverage / arrivedPersons).toLocaleTimeString(),
              ),
              bold: true,
            },
          ],
          margin: [0, 0, 0, 10],
        },
        {
          text: "Lista de Presenças",
          alignment: "center",
          bold: true,
          fontSize: 18,
          margin: [0, 1080, 0, 20],
        },
        {
          layout: {
            paddingBottom: (i, node) => {
              return padding;
            },
            paddingLeft: (i, node) => {
              return padding;
            },
            paddingRight: (i, node) => {
              return padding;
            },
            paddingTop: (i, node) => {
              return padding;
            },
            fillColor: (rowIndex, node, columnIndex) => {
              return rowIndex % 2 !== 0 ? "#dad8d8" : "";
            },
          },
          table: {
            headerRows: 1,
            widths: ["10%", "64%", "*"],

            body: [
              [
                { text: "Mesa", alignment: "center" },
                { text: "Nome", alignment: "center" },
                { text: "Hora de chegada", alignment: "center" },
              ],
              ...presences.map((presence) => {
                return [
                  {
                    text: presence.table.number,
                    alignment: "center",
                  },
                  {
                    text: presence.person_name,
                    bold: true,
                  },
                  {
                    text: presence.arrived_at?.toLocaleTimeString() || "",
                    alignment: "center",
                  },
                ];
              }),
            ],
          },
        },
      ],

      footer: (currentPage, pageCount) => {
        return {
          text: `${currentPage} / ${pageCount}`,
          alignment: "center",
          fontSize: 12,
          margin: [0, 12, 0, 0],
        };
      },
      defaultStyle: {
        font: "Helvetica",
        fontSize: 16,
      },
    };

    const pdfName = order === "name" ? "nome" : "mesa";

    var pdfDoc = printer.createPdfKitDocument(pdfContent);

    await new Promise(async (resolve) => {
      const writeStream = fileSystem.createWriteStream(
        `${tmpFolder}/presencesReport-${pdfName}.pdf`,
      );

      pdfDoc.pipe(writeStream);
      pdfDoc.end();

      writeStream.on("close", resolve);
    });

    return res.download(`${tmpFolder}/presencesReport-${pdfName}.pdf`);
  }
}
