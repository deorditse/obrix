import 'dart:typed_data';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart' show rootBundle;
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/text_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:models/models.dart';

Future<Uint8List> generateDocument(
  PdfPageFormat format,
  SplitImageModel data,
) async {
  final doc = Document(pageMode: PdfPageMode.outlines);
  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();

  format =
      /*    data.formatImage == FormatImage.a4 ?*/
      PdfPageFormat.a4; /*: PdfPageFormat.a3;*/

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
                Row(
                  children: colors
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                e.name,
                                style: const TextStyle(
                                  fontSize: 4,
                                ),
                              ),
                              Container(
                                width: 14,
                                height: 14,
                                color: PdfColor.fromInt(e.colorInt),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
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
                          _getColor(data.mapRowIndexAndListColor[indexRow]![
                                  indexColumn])
                              .colorInt,
                          // data.mapRowIndexAndListColor[indexRow]![indexColumn],
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

  double _sizePixel = format.width / 3 / data.kSegmentsWidth + 5;

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
            childAspectRatio: data.formatImage == FormatImage.a3
                ? 0.5
                : (data.kSegmentsWidth) / data.kSegmentsHeight,
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
                              final NameColor _color =
                                  _getColor(colorPixels[indexPixel]);
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
                                      Stack(
                                        children: [
                                          Container(
                                            width: data.sizePixel!.width,
                                            height: data.sizePixel!.height,
                                            color: PdfColor.fromInt(
                                                _color.colorInt),
                                          ),
                                          Text(
                                            _color.name,
                                            style: TextStyle(
                                              fontSize: 4,
                                              color: _color.colorInt ==
                                                          colors
                                                              .first.colorInt ||
                                                      _color.colorInt ==
                                                          colors[1].colorInt
                                                  ? PdfColor.fromInt(material
                                                      .Colors.black.value)
                                                  : PdfColor.fromInt(material
                                                      .Colors.white.value),
                                            ),
                                          ),
                                        ],
                                      )
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
      ],
    ),
  );

  return await doc.save();
}

class NameColor {
  NameColor({
    required this.name,
    required this.colorInt,
  });

  final String name;
  final int colorInt;
}

List<NameColor> colors = [
  NameColor(name: 'A1', colorInt: 0xFFbebebe),
  NameColor(name: 'A2', colorInt: 0xFF7a7c7d),
  NameColor(name: 'A3', colorInt: 0xFF535554),
  NameColor(name: 'A4', colorInt: 0xFF383a3e),
];

NameColor _getColor(int colorInt) {
  int minDiff = colorInt;
  NameColor closestColor = colors.first;
  for (int color in colors.map((e) => e.colorInt).toList()) {
    int redDiff = ((colorInt >> 16) & 0xFF) - ((color >> 16) & 0xFF);
    int greenDiff = ((colorInt >> 8) & 0xFF) - ((color >> 8) & 0xFF);
    int blueDiff = (colorInt & 0xFF) - (color & 0xFF);
    int diff = redDiff.abs() + greenDiff.abs() + blueDiff.abs();
    if (diff < minDiff) {
      minDiff = diff;
      closestColor = colors.firstWhere((element) => element.colorInt == color);
    }
  }
  print("Ближайший цвет: ${closestColor}");
  return closestColor;
}
