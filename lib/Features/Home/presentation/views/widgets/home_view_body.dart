import 'package:flutter/material.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import '../../../../../Core/widgets/custom_error_widget.dart';
import '../../../../../Core/widgets/custom_loading_widget.dart';
import '../../manager/character_cubit/character_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'characters_grid_view.dart';

import 'empty_searched_characters.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<CharacterEntity> characters = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersCubit, CharactersState>(
      listener: (context, state) {
        if (state is CharactersPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        } else if (state is CharactersSuccess) {
          characters =
              BlocProvider.of<CharactersCubit>(context).searchedCharacters;
        }
      },
      builder: (context, state) {
        if (state is CharactersSuccess ||
            state is CharactersPaginationLoading ||
            state is CharactersPaginationFailure) {
          if (BlocProvider.of<CharactersCubit>(context)
              .searchedCharacters
              .isEmpty) {
            return const EmptySearchedCharacters();
          } else {
            return CharactersGridView(characters: characters);
          }
        } else if (state is CharactersLoading) {
          return const CustomLoadingWidget();
        } else if (state is CharactersFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        return Container();
      },
    );
  }
}
