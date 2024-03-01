import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import '../../manager/character_cubit/character_cubit.dart';
import 'characters_grid_view_item.dart';
import '../../../../../Core/utils/constants.dart';

class CharactersGridView extends StatefulWidget {
  const CharactersGridView({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<CharacterEntity> characters;

  @override
  State<CharactersGridView> createState() => _CharactersGridViewState();
}

class _CharactersGridViewState extends State<CharactersGridView> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int nextPage = 2;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double percentage = (currentScroll / maxScroll) * 100;

    // Check if the scroll position is at 70% or more
    if (percentage >= 70) {
      // Check if the previous request is completed
      if (!isLoading) {
        isLoading = true;
        if(nextPage > 42) return; // 42 is the last page
        await BlocProvider.of<CharactersCubit>(context)
            .fetchCharacters(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(kPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) => CharactersGridViewItem(
        characterEntity: widget.characters[index],
      ),
      itemCount: widget.characters.length,
    );
  }
}
