import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets_data.dart';

class EmptySearchedCharacters extends StatelessWidget {
  const EmptySearchedCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AssetsData.emptySearched,
            height: 280,
            width: double.infinity,
          ),
        ),
        const Text(
          'No characters found ',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
