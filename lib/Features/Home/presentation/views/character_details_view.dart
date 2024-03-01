import 'package:flutter/material.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import '../../../../Core/utils/my_colors.dart';
import 'widgets/character_details_view_app_bar.dart';
import 'widgets/character_details_view_body.dart';

class CharacterDetailsView extends StatelessWidget {
  const CharacterDetailsView({super.key, required this.characterEntity});

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appBarColor,
      body: CustomScrollView(
        slivers: [
          CharacterDetailsViewAppBar(
            characterEntity: characterEntity,
          ),
          CharacterDetailsViewBody(
            characterEntity: characterEntity,
          ),
        ],
      ),
    );
  }
}
