import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/styles.dart';

class CharactersGridViewItem extends StatelessWidget {
  const CharactersGridViewItem({
    super.key,
    required this.characterEntity,
  });

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kCharacterDetailsView, extra: characterEntity);
      },
      child: Hero(
        tag: characterEntity.characterImage!,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: characterEntity.characterImage!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: double.infinity,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Text(
                  characterEntity.characterName!,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
