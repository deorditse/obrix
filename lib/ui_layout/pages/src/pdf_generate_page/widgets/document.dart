import 'dart:typed_data';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart' show rootBundle;
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/text_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:models/models.dart';

Future<Uint8List> generateDocument(
    PdfPageFormat format, SplitImageModel data) async {
  final doc = Document(pageMode: PdfPageMode.outlines);
  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final shape = await rootBundle.loadString('assets/generate-pdf/document.svg');
  final swirls = await rootBundle.loadString('assets/generate-pdf/swirls2.svg');

  doc.addPage(
    Page(
      theme: ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: PageOrientation.portrait,
      build: (context) {
        return Column(children: [
          Header(
            level: 0,
            title: 'Portable Document Format',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Инструкция от QBRIX', textScaleFactor: 2),
                PdfLogo()
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: data.mapRowIndexAndListColor.keys.length,
              itemBuilder: (Context context, int indexRow) {
                return FittedBox(
                  child: ListView.builder(
                    direction: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount:
                        data.mapRowIndexAndListColor[indexRow]?.length ?? 0,
                    itemBuilder: (context, int indexColumn) {
                      return Container(
                        width: data.sizePixel!.width,
                        height: data.sizePixel!.height,
                        color: PdfColor.fromInt(
                          data.mapRowIndexAndListColor[indexRow]![indexColumn]
                              .value,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ]);
      },
    ),
  );

  print('document.dart ' +
      '${data.indexSegmentToIndexRowSegmentAndListPixelsColorHex.values}');

  doc.addPage(
    MultiPage(
      theme: ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: PageOrientation.portrait,
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: PdfColors.grey))),
          child: Text(
            'QBRIX инструкция',
            style: Theme.of(context)
                .defaultTextStyle
                .copyWith(color: PdfColors.grey),
          ),
        );
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text(
                'Страница ${context.pageNumber} из ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
        GridView(
          childAspectRatio: 0.5,
          crossAxisCount: 3,
          children: List<Widget>.generate(
            9,
            (index) => Container(
              alignment: Alignment.center,
              child: Text('Item $index'),
            ),
          ),
        ),

        ///идем по сегментам сверху вниз

        //просто располагаю сегменты в ряд
        ListView.builder(
          direction: Axis.vertical,
          padding: EdgeInsets.zero,
          itemCount: data
              .indexSegmentToIndexRowSegmentAndListPixelsColorHex.keys.length,
          itemBuilder: (Context context, int indexSegmentColumn) {
            ///вошли внутрь сегмента
            return GridView(
                crossAxisCount: 3,
                childAspectRatio: 0.5,
                children: data
                    .indexSegmentToIndexRowSegmentAndListPixelsColorHex[indexSegmentColumn]!                                                                                                                                                                                                       .keys
                    .map((int indexSegmentRow) {
                  return Text(
                    '$indexSegmentRow',
                    style: TextStyle(color: PdfColors.red),
                  );
                }).toList());
          },
        ),

        // ListView.builder(
        //   direction: Axis.vertical,
        //   padding: EdgeInsets.zero,
        //   itemCount: data
        //       .indexSegmentToIndexRowSegmentAndListPixelsColorHex.keys.length,
        //   itemBuilder: (Context context, int indexSegment) {
        //     ///вошли внутрь сегмента
        //     return FittedBox(
        //       child: ListView.builder(
        //         direction: Axis.horizontal,
        //         padding: EdgeInsets.zero,
        //         itemCount: data.mapRowIndexAndListColor[indexRow]?.length ?? 0,
        //         itemBuilder: (context, int indexColumn) {
        //           return Container(
        //             width: data.sizePixel!.width,
        //             height: data.sizePixel!.height,
        //             color: PdfColor.fromInt(
        //               data.mapRowIndexAndListColor[indexRow]![indexColumn]
        //                   .value,
        //             ),
        //           );
        //         },
        //       ),
        //     );
        //   },
        // ),
      ],
    ),
  );

  return await doc.save();
}
