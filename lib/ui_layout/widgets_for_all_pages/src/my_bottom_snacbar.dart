import 'package:flutter/material.dart';
import 'package:obrix/ui_layout/my_ui_const_app.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';

void myBottomSnackBar(
  BuildContext context, {
  required String content,
  Duration? duration,
  String? iconLabel,
  bool isErrorBackground = false,
}) {
  final SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
                minWidth: 400,
                maxWidth: !AdaptiveWidget.isDesktop(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width * 0.5),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(11, 21, 46, 0.24), //New
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                )
              ],
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color.fromRGBO(38, 38, 38, 0.15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: Center(
                          child: Icon(
                            isErrorBackground
                                ? Icons.error_outline
                                : Icons.info,
                            color: !isErrorBackground
                                ? Theme.of(context).primaryColor
                                : Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Flexible(
                        child: Text(
                          content,
                          style: myTextStyleFontOswald(
                            context: context,
                            newFontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      MyUiConstApp.snackBarKey.currentState
                          ?.hideCurrentSnackBar();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).textTheme.titleSmall!.color,
                    )),
              ],
            ),
          ),
        ),
      ],
    ),
    duration: duration ?? const Duration(seconds: 5),
  );
  MyUiConstApp.snackBarKey
    ..currentState?.hideCurrentSnackBar()
    ..currentState?.showSnackBar(snackBar);
}
