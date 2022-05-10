import { Request, Response } from "express";
import path from "path";
import fileSystem from "fs";
import { prisma } from "../../database/prismaClient";

import pdfPrinter from "pdfmake";
import { TDocumentDefinitions } from "pdfmake/interfaces";

export default class ReportsController {
  async store(req: Request, res: Response) {
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
        person_name: "asc",
      },
      select: {
        person_name: true,
        table: {
          select: {
            number: true,
          },
        },
      },
    });

    const padding = 6;
    const pdfContent: TDocumentDefinitions = {
      content: [
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
                  { text: "" },
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

    var pdfDoc = printer.createPdfKitDocument(pdfContent);
    pdfDoc.pipe(
      fileSystem.createWriteStream(`${tmpFolder}/presencesReport2.pdf`),
    );
    pdfDoc.end();

    return res.send();
  }
}
