import 'dart:ffi';

import 'package:flutter/material.dart';

class UtilFunctions {
  //navigetor function
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  //go back
  static void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
