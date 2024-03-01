import 'package:flutter/material.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

import 'character_info.dart';
import 'custom_divider.dart';
import '../../../../../Core/utils/constants.dart';

class CharacterDetailsViewBody extends StatelessWidget {
  const CharacterDetailsViewBody({super.key, required this.characterEntity});

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CharacterInfo(
                    title: 'Status : ',
                    value: characterEntity.characterStatus!),
                const CustomDivider(endIndent: 305),
                CharacterInfo(
                    title: 'Species : ',
                    value: characterEntity.characterSpecies!),
                const CustomDivider(endIndent: 290),
                CharacterInfo(
                    title: 'Type : ',
                    value: characterEntity.characterType!.isEmpty
                        ? 'Unknown'
                        : characterEntity.characterType!),
                const CustomDivider(endIndent: 320),
                CharacterInfo(
                    title: 'Gender : ',
                    value: characterEntity.characterGender!),
                const CustomDivider(endIndent: 300),
                const SizedBox(
                  height: 395,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
