import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:obrix/ui_layout/pages/pages.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum PageDisplayStyle {
  desktop,
  mobile,
}

class HomePage extends StatelessWidget {
  static const String id = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AdaptiveWidget(
      desktopScreen: _HomePage(
        key: ValueKey('desktop'),
        displayStyle: PageDisplayStyle.desktop,
      ),
      mobileScreen: _HomePage(
        key: ValueKey('mobile'),
        displayStyle: PageDisplayStyle.mobile,
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  final PageDisplayStyle displayStyle;

  const _HomePage({
    Key? key,
    required this.displayStyle,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  String? _uploadedBlobUrl;
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return WrapperSceletonPage(child: _body());
  }

  Widget _body() {
    if (_croppedFile != null || _uploadedBlobUrl != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              elevation: 4.0,
              child: _image(),
            ),
          ),
          const SizedBox(height: 24.0),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 0.8 * screenWidth,
            maxHeight: 0.7 * screenHeight,
          ),
          child: Image.network(
            _croppedFile!.path,
            fit: BoxFit.contain,
          ));
    } else if (_uploadedBlobUrl != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: Image.network(_uploadedBlobUrl!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            _clear();
          },
          backgroundColor: ColorStyles.red,
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
        if (_croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () {
                _cropImage();
              },
              backgroundColor: ColorStyles.blue,
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PdfGeneratePage(
                      croppedFile: _croppedFile,
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.image_aspect_ratio),
                  const SizedBox(width: 20),
                  Text('Сделать пазл',
                      style: myTextStyleFontOswald(
                        fontSize: 24,
                        textColor: ColorStyles.white,
                      ))
                ],
              ),
            ),
          )
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          width: 380.0,
          height: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DottedBorder(
                radius: const Radius.circular(12.0),
                borderType: BorderType.RRect,
                dashPattern: const [8, 4],
                color: Theme.of(context).highlightColor.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        color: Theme.of(context).highlightColor,
                        size: 80.0,
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Upload an image to start',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Theme.of(context).highlightColor,
                                ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _uploadImage();
                },
                child: const Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _cropImage() async {
    if (_uploadedBlobUrl != null) {
      WebUiSettings settings;
      if (widget.displayStyle == PageDisplayStyle.mobile) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        settings = WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.page,
          boundary: CroppieBoundary(
            width: ((screenWidth * 0.9)).round(),
            height: (screenWidth * 0.9 * 1.414141).round(),
          ),
          viewPort: CroppieViewPort(
            width: ((screenWidth * 0.85)).round(),
            height: (screenWidth * 0.85 * 1.414141).round(),
          ),
          enableExif: true,
          enableOrientation: true,
          enableZoom: true,
          enforceBoundary: true,
          mouseWheelZoom: true,
          showZoomer: true,
        );
      } else {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        settings = WebUiSettings(
          context: context,
          // presentStyle: CropperPresentStyle.dialog,
          boundary: CroppieBoundary(
            width: ((screenHeight * 0.7) * 1.414141).round(),
            height: (screenHeight * 0.7).round(),
          ),
          viewPort: CroppieViewPort(
            width: ((screenHeight * 0.65) * 1.414141).round(),
            height: (screenHeight * 0.65).round(),
          ),
          enableExif: true,
          enableOrientation: true,
          enableZoom: true,
          enforceBoundary: true,
          mouseWheelZoom: true,
          showZoomer: true,
        );
      }
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _uploadedBlobUrl!,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [settings],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final blobUrl = pickedFile.path;
      debugPrint('picked blob: $blobUrl');
      setState(() {
        _uploadedBlobUrl = blobUrl;
      });
    }
  }

  void _clear() {
    setState(() {
      _uploadedBlobUrl = null;
      _croppedFile = null;
    });
  }
}
