import 'package:flutter/material.dart';
import 'my_colors.dart';

abstract class Styles {
  static const textStyle16 = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: MyColors.myWhite,
  );

  static const textStyle22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: MyColors.myWhite,
  );

  static const textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const textStyle40 = TextStyle(
    fontSize: 40.0,
  );

  static const textStyle43 = TextStyle(
    fontSize: 43.0,
  );
}
