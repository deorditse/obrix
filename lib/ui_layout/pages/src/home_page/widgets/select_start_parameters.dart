import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:business_layout/business_layout.dart';
import 'package:models/models.dart';
import 'package:obrix/ui_layout/my_ui_const_app.dart';
import 'package:obrix/ui_layout/pages/pages.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/check_box.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/my_bottom_snacbar.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/color_styles.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/text_style.dart';

class SelectParameters extends StatefulWidget {
  const SelectParameters({super.key});

  @override
  State<SelectParameters> createState() => _SelectParametersState();
}

class _SelectParametersState extends State<SelectParameters> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: BlocBuilder<QbrixBloc, QbrixState>(
            buildWhen: (prev, next) => next.splitImageModel.formatImage != null,
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1. Выберите формат полотна',
                    style: myTextStyleFontOswald(
                      context: context,
                      fontSize: 24,
                    ),
                  ),
                  MyUiConstApp.myTopSizedBox,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyCheckBox(
                        value:
                            state.splitImageModel.formatImage == FormatImage.a3,
                        onChanged: (_) {
                          BlocProvider.of<QbrixBloc>(context).add(
                            const QbrixEvent.selectCropFormat(
                              formatImage: FormatImage.a3,
                            ),
                          );
                        },
                      ),
                      Text('A3'),
                      MyUiConstApp.myHorizontalSizedBox,
                      MyCheckBox(
                          value: state.splitImageModel.formatImage ==
                              FormatImage.a4,
                          onChanged: (_) {
                            BlocProvider.of<QbrixBloc>(context).add(
                              const QbrixEvent.selectCropFormat(
                                formatImage: FormatImage.a4,
                              ),
                            );
                          }),
                      Text('A4'),
                    ],
                  ),
                  MyUiConstApp.myTopSizedBox,
                  Text(
                    '2. Загрузите изображение',
                    style: myTextStyleFontOswald(
                      context: context,
                      fontSize: 24,
                    ),
                  ),
                  MyUiConstApp.myTopSizedBox,
                  MyUiConstApp.myTopSizedBox,
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                      state.splitImageModel.formatImage == null
                          ? ColorStyles.primaryColorDisable
                          : ColorStyles.primaryColor,
                    )),
                    onPressed: () {
                      if (state.splitImageModel.formatImage == null) {
                        myBottomSnackBar(
                          context,
                          content: "Для продолжения выберите формат полотна",
                          isErrorBackground: true,
                        );
                        return;
                      }
                      _uploadImage(context);
                    },
                    child: const Text(
                      'Загрузить фото',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _uploadImage(context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      BlocProvider.of<QbrixBloc>(context)
          .add(QbrixEvent.pickNewImagePath(imagePath: pickedFile.path));
    }
  }
}
