import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AppConstants {
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
