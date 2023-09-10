import 'dart:typed_data';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart' show rootBundle;
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/text_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:models/models.dart';

import 'components/wrapper_segment.dart';

Future<Uint8List> generateDocument(
  PdfPageFormat format,
  SplitImageModel data,
) async {
  final doc = Document(pageMode: PdfPageMode.outlines);
  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final shape = await rootBundle.loadString('assets/generate-pdf/document.svg');
  final swirls = await rootBundle.loadString('assets/generate-pdf/swirls2.svg');

  format =
      data.formatImage == FormatImage.a4 ? PdfPageFormat.a4 : PdfPageFormat.a3;

  doc.addPage(
    Page(
      theme: ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format,
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
                          data.mapRowIndexAndListColor[indexRow]![indexColumn],
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

  final List<Uint8List> allSegments = [];
  for (var element in data.indexColumnAndSegmentsImage.values) {
    allSegments.addAll(element);
  }

  final List<Map<int, List<int>>> allSegmentsinPexels = [];
  for (var segment in data.indexColumnAndSegmentsInRowInPixels.values) {
    allSegmentsinPexels.addAll(segment);
  }

  double _sizePixel = format.width / 3 / data.kSegmentsWidth;

  doc.addPage(
    MultiPage(
      maxPages: 1000,
      theme: ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format,
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
        // SizedBox(
        //   width: format.width,
        //   child: GridView(
        //     // direction: Axis.horizontal,
        //     crossAxisCount: 3,
        //     childAspectRatio: 0.5,
        //     children: data
        //         .indexSegmentToIndexRowSegmentAndListPixelsColorHex.keys
        //         .map((int indexSegment) {
        //       return Text('indexSegment $indexSegment');
        //     }).toList(),
        //   ),
        // ),
        // SizedBox(
        //   width: format.width,
        //   child: GridView(
        //     crossAxisCount: 3,
        //     childAspectRatio: 0.5,
        //     children: data
        //         .indexSegmentToIndexRowSegmentAndListPixelsColorHex.values
        //         .map((segment) {
        //       return ListView.builder(
        //         direction: Axis.vertical,
        //         itemCount: segment.keys.length,
        //         itemBuilder: (context, indexRowSegment) {
        //           final List colorPixels = segment[indexRowSegment] ?? [];
        //           return ListView.builder(
        //             direction: Axis.horizontal,
        //             itemCount: colorPixels.length,
        //             itemBuilder: (context, indexPixel) {
        //               return Container(
        //                 width: data.sizePixel!.width,
        //                 height: data.sizePixel!.height,
        //                 color: PdfColor.fromInt(
        //                   colorPixels[indexPixel].value,
        //                 ),
        //               );
        //             },
        //           );
        //         },
        //       );
        //     }).toList(),
        //   ),
        // ),
        SizedBox(
          width: format.width,
          child: GridView(
            crossAxisCount: 3,
            childAspectRatio: (data.kSegmentsWidth) / data.kSegmentsHeight,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.zero,
            children: allSegmentsinPexels.map((Map<int, List<int>> segment) {
              int indexSegment = allSegmentsinPexels.indexOf(segment);
              if (segment.keys.length < 10) {
                return SizedBox.shrink();
              } else {
                return Row(
                  children: [
                    SizedBox(
                      width: _sizePixel / 2,
                      child: Text(
                        (indexSegment + 1).toString(),
                        style: const TextStyle(fontSize: 9),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        direction: Axis.vertical,
                        itemCount: segment.keys.length,
                        itemBuilder: (context, indexRowSegment) {
                          final List<int> colorPixels =
                              segment[indexRowSegment] ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            direction: Axis.horizontal,
                            itemCount: colorPixels.length,
                            itemBuilder: (context, indexPixel) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (indexPixel == 0)
                                    SizedBox(
                                      width: _sizePixel / 2,
                                      child: Text(
                                        (indexRowSegment + 1).toString(),
                                        style: const TextStyle(
                                          fontSize: 4,
                                        ),
                                      ),
                                    ),
                                  Column(
                                    children: [
                                      if (indexRowSegment == 0)
                                        Text(
                                          (indexPixel + 1).toString(),
                                          style: const TextStyle(fontSize: 4),
                                        ),
                                      Container(
                                        width: data.sizePixel!.width,
                                        height: data.sizePixel!.height,
                                        color: PdfColor.fromInt(
                                          colorPixels[indexPixel],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }).toList(),
          ),
        ),

        ///image segments
        // Text(
        //     '______________________________________________________________________'
        //     '______________________________________________________________________'
        //     '______________________________________________________________________'
        //     ''),
        // SizedBox(
        //   width: format.width,
        //   child: GridView(
        //     crossAxisCount: 3,
        //     childAspectRatio: 1,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     padding: const EdgeInsets.all(10),
        //     children: allSegments.map((segment) {
        //       return WrapperSegment(
        //         child: SizedBox(
        //           width: _sizePixel * data.kSegmentsWidth,
        //           height: _sizePixel * data.kSegmentsHeight,
        //           child: Image(
        //             MemoryImage(segment),
        //             fit: BoxFit.contain,
        //           ),
        //         ),
        //         indexSegment: allSegments.indexOf(segment),
        //         formatImage: data.formatImage ?? FormatImage.a4,
        //         kSegmentsWidth: data.kSegmentsWidth,
        //         kSegmentsHeight: data.kSegmentsHeight,
        //       );
        //     }).toList(),
        //   ),
        // ),
        ///
        // SizedBox(
        //   width: format.width,
        //   child: GridView(
        //
        //     crossAxisCount: 3,
        //     childAspectRatio: 0.5,
        //     children:
        //         data.indexColumnAndSegmentsImage.keys.map((int indexColumn) {
        //       List<Uint8List> listSegments =
        //           data.indexColumnAndSegmentsImage[indexColumn]!;
        //       return ListView.builder(
        //         direction: Axis.horizontal,
        //         itemCount: listSegments.length,
        //         itemBuilder: (context, indexSegment) {
        //           final Uint8List imageSegment = listSegments[indexSegment];
        //
        //           return Image(
        //             MemoryImage(imageSegment),
        //             width: format.width / data.kSegmentsWidth,
        //             height: format.height / data.kSegmentsHeight,
        //           );
        //         },
        //       );
        //     }).toList(),
        //   ),
        // ),

        // SizedBox(
        //   width: format.width,
        //   child: ListView.builder(
        //     direction: Axis.vertical,
        //     itemBuilder: (context, indexColumn) {
        //       List<Uint8List> listSegments =
        //       data.indexColumnAndSegmentsImage[indexColumn]!;
        //       return ListView.builder(
        //         direction: Axis.horizontal,
        //         itemCount: listSegments.length,
        //         itemBuilder: (context, indexSegment) {
        //           final Uint8List imageSegment = listSegments[indexSegment];
        //
        //           return Image(
        //             MemoryImage(imageSegment),
        //             width: format.width / data.kSegmentsWidth,
        //             height: format.height / data.kSegmentsHeight,
        //           );
        //         },
        //       );
        //     },
        //     itemCount: data.indexColumnAndSegmentsImage.keys.length,
        //   ),
        // ),
      ],
    ),
  );

  return await doc.save();
}
