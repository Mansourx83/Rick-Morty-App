import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_application/Core/utils/constants.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import 'Core/utils/service_locator.dart';

import 'Core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterEntityAdapter());
  await Hive.openBox<CharacterEntity>(kCharactersBox);

  setupServiceLocator();
  runApp(
    const RickAndMortyApp(),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
