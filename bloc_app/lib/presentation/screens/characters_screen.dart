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
      itemCount: allCharacters!.length,
      itemBuilder: (ctx, index){
        return CharacterItem(character: allCharacters![index],);
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
  title: Text(
    "Rick and Morty",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
      letterSpacing: 1.2,
    ),
  ),
  centerTitle: true,
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.green.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
  ),
  elevation: 6,
  shadowColor: Colors.black45,
),

    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/RM_page-header_background1.png"), 
          fit: BoxFit.cover,
        ),
      ),
      child: BuildBlocWidget(), 
    ),
  );
}

}
