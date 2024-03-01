import 'package:flutter/material.dart';

import '../../../../../Core/utils/my_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.endIndent});
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.myYellow,
      endIndent: endIndent,
      height: 30,
      thickness: 2,
    );
  }
}
