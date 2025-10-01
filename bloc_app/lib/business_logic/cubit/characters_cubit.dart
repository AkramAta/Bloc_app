import 'package:bloc_app/data/models/characters.dart';
import 'package:bloc_app/data/repo/characters_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  late List<Results> characters;

  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<Results> getAllCharacters() {
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });

    return characters;
  }
}
