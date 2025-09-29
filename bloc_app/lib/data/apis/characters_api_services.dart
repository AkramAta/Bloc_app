import 'package:bloc_app/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersApiServices {
  late Dio dio;

  CharactersApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return {"":""};
    }
  }
}
