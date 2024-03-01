import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_application/Features/Home/Data/repo/home_repo_impl.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import '../../Features/Home/Domain/use_cases/fetch_characters_use_case.dart';
import 'service_locator.dart';
import '../../Features/Home/presentation/views/character_details_view.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/Home/presentation/manager/character_cubit/character_cubit.dart';
import '../../Features/Home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';
  static const kCharacterDetailsView = '/characterDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) => CharactersCubit(
            FetchCharactersUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          )..fetchCharacters(pageNumber: 1),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kCharacterDetailsView,
        builder: (context, state) => CharacterDetailsView(
          characterEntity: state.extra! as CharacterEntity,
        ),
      ),
    ],
  );
}
