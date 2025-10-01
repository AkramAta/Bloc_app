import 'package:bloc_app/data/apis/characters_api_services.dart';
import 'package:bloc_app/data/models/characters.dart';

class CharactersRepo {
  final CharactersApiServices charactersApiServices;

  CharactersRepo(this.charactersApiServices);

  Future<List<Results>> getAllCharacters() async {
    final response = await charactersApiServices.getAllCharacters();
    final results = response["results"] as List;

    return results.map((character) => Results.fromJson(character)).toList();
  }
}
