import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:obrix/ui_layout/pages/pages.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:models/models.dart';

class CropImage extends StatelessWidget {
  const CropImage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              clipBehavior: Clip.hardEdge,
              child: BlocBuilder<QbrixBloc, QbrixState>(
                buildWhen: (prev, next) => next.croppedFile != prev.croppedFile,
                builder: (context, state) {
                  return Image.network(
                    state.croppedFile?.path ?? imagePath,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Colors.red,
                onPressed: () {
                  BlocProvider.of<QbrixBloc>(context).add(
                    const QbrixEvent.clearAll(),
                  );
                },
                tooltip: 'Delete',
                child: const Icon(Icons.delete),
              ),
              BlocBuilder<QbrixBloc, QbrixState>(
                buildWhen: (prev, next) => next.croppedFile != prev.croppedFile,
                builder: (context, state) {
                  if (state.croppedFile == null) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: FloatingActionButton(
                        heroTag: "btn2",
                        onPressed: () async {
                          await _cropImage(context,
                              formatImage: state.splitImageModel.formatImage!);
                        },
                        tooltip: 'Crop',
                        child: const Icon(Icons.crop),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(PdfGeneratePage.id);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.image_aspect_ratio),
                            SizedBox(width: 20),
                            Text('Сделать пазл')
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _cropImage(
    BuildContext context, {
    required FormatImage formatImage,
  }) async {
    WebUiSettings settings;
    final bool isDesktop = AdaptiveWidget.isDesktop(context);
    Size sizeViewPort = getSizeViewPort(context,
        isDesktop: isDesktop, formatImage: formatImage);
    settings = WebUiSettings(
      context: context,
      presentStyle: CropperPresentStyle.page,
      boundary: CroppieBoundary(
        height:
            (MediaQuery.of(context).size.height - kTextTabBarHeight).round(),
        width: MediaQuery.of(context).size.width.round(),
      ),
      viewPort: CroppieViewPort(
        width: sizeViewPort.width.round(),
        height: sizeViewPort.height.round(),
      ),
      // enableOrientation: true,
      enableZoom: true,
      enableResize: false,
      mouseWheelZoom: true,
      showZoomer: true,
      barrierColor: Theme.of(context).primaryColor,
    );

    await ImageCropper().cropImage(
      sourcePath: imagePath,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [settings],
    ).then(
      (CroppedFile? croppedFile) {
        if (croppedFile != null) {
          print(' croppedFile != null');
          BlocProvider.of<QbrixBloc>(context)
              .add(QbrixEvent.addCroppedImage(croppedFile: croppedFile));
        }
      },
    );
  }
}

Size getSizeViewPort(
  BuildContext context, {
  required bool isDesktop,
  required FormatImage formatImage,
}) {
//Отношение ширины к длине для форматов
  double dWToH = 1 / 1.4142;

  double maxHeight = MediaQuery.of(context).size.height -
      kTextTabBarHeight -
      (isDesktop ? 40 : 0);

  double maxWidth = MediaQuery.of(context).size.width - (isDesktop ? 0 : 10);

  double kHeight = isDesktop ? maxHeight : maxWidth / dWToH;
  double kWidth = isDesktop ? maxHeight * dWToH : maxWidth;

  double height = kHeight;
  double width = kWidth;

  /// FormatImage.a3

  ///FormatImage.a4

  return Size(width, height);
}
