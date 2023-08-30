import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 30,
      height: 30,
      child: /*CupertinoActivityIndicator()*/
          //
          CircularProgressIndicator(
        strokeWidth: 2,
      ),
    ));
  }
}
