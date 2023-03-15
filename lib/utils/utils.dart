import 'package:flutter/material.dart';

class Utils {
  bool getScreenSize(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width < 1000) {
      return true;
    }
    return false;
  }
}
