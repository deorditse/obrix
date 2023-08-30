import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({Key? key, required this.value, required this.onChanged})
      : super(key: key);
  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(color: Theme.of(context).textTheme.titleSmall!.color!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      activeColor: Theme.of(context).primaryColor,
      value: value,
      onChanged: onChanged,
    );
  }
}
