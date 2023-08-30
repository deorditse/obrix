import 'package:flutter/material.dart';
import 'package:obrix/ui_layout/my_ui_const_app.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/text_style.dart';

class AnimatedIconDeveloper extends StatefulWidget {
  const AnimatedIconDeveloper({super.key, this.text});

  final String? text;

  @override
  State<AnimatedIconDeveloper> createState() => _AnimatedIconDeveloperState();
}

class _AnimatedIconDeveloperState extends State<AnimatedIconDeveloper>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.view_list,
            progress: animation,
            size: 100.0,
            color: Theme.of(context).textTheme.titleMedium!.color,
            semanticLabel: 'Show menu',
          ),
        ),
        MyUiConstApp.myTopSizedBox,
        Text(
          widget.text ?? 'Страница в стадии разработки',
          style: myTextStyleFontOswald(fontSize: 22, context: context),
        ),
      ],
    );
  }
}
