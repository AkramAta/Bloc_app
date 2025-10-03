import 'package:bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_app/constants/colors.dart';
import 'package:bloc_app/data/models/characters.dart';
import 'package:bloc_app/presentation/widgets/character_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Results>? allCharacters;

  @override
  void initState() {
    super.initState();

    allCharacters = BlocProvider.of<CharactersCubit>(
      context,
    ).getAllCharacters();
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedList();
        } else {
          return BuildLoadingIndicator();
        }
      },
    );
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(child: Column(children: [buildGridListView()])),
    );
  }

  Widget buildGridListView() {
    return GridView.builder(
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
      ), 
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index){
        return CharacterItem();
      },
    );
  }

  Widget BuildLoadingIndicator() {
    return Center(child: CircularProgressIndicator(color: MyColors.yellow));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        title: Text("Ricky and Morty", style: TextStyle(color: MyColors.white)),
      ),
      body: BuildBlocWidget(),
    );
  }
}
