import 'package:flutter/material.dart';

class AppHelpers {
  AppHelpers._();

  

  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).unfocus();
}
