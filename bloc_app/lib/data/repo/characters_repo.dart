import 'package:bloc_app/data/apis/characters_api_services.dart';
import 'package:bloc_app/data/models/characters.dart';

class CharactersRepo {
  final CharactersApiServices charactersApiServices;

  CharactersRepo(this.charactersApiServices);

  Future<List<Characters>> getAllCharacters() async {
    final response = await charactersApiServices.getAllCharacters();

    final results = response["results"] as List; // extract the list part

    return results.map((character) => Characters.fromJson(character)).toList();
  }
}
