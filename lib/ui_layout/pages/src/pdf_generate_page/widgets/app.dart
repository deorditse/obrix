import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:models/models.dart';
import 'document/document.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.splitImageModel,
  }) : super(key: key);

  final SplitImageModel splitImageModel;

  void _showPrintedToast(BuildContext context) {
    myBottomSnackBar(context, content: 'Печать инструкции');
  }

  void _showSharedToast(BuildContext context) {
    myBottomSnackBar(context, content: 'Инструкция скачивается');
  }

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];

    return Scaffold(
      body: PdfPreview(
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        shouldRepaint: true,
        padding: EdgeInsets.zero,
        maxPageWidth: 700,
        build: (format) => generateDocument(
          format,
          splitImageModel,
        ),
        actions: actions,
        onPrinted: _showPrintedToast,
        onShared: _showSharedToast,
      ),
    );
  }
}
