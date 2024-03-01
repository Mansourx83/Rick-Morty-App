import 'package:flutter/material.dart';
import 'package:rick_and_morty_application/Core/utils/my_colors.dart';
import '../utils/assets_data.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.noInternet),
        Text(
          'No Internet',
          style: TextStyle(
            fontSize: 24,
            color: MyColors.appBarColor,
          ),
        ),
        Text(
          'please check the internet and try again',
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(195, 139, 195, 74),
          ),
        ),
      ],
    );
  }
}
