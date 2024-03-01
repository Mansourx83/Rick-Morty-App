import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Styles.textStyle24,
          ),
          TextSpan(
            text: value,
            style: Styles.textStyle22,
          ),
        ],
      ),
    );
  }
}
