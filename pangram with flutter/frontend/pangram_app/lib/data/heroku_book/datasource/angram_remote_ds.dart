import 'dart:convert';

import 'package:demo_app/core/dependency_injection/getit_configuration.dart';
import 'package:demo_app/core/network/heroku_client.dart';
import 'package:demo_app/data/heroku_book/model/AnagramModel.dart';
import 'package:demo_app/domain/entities/AnagramEntity.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(AnagramDsImpl)
@injectable
abstract class AnagramDs {
//  Future<List<dynamic>> getAnagramByKeyword(String keyword);
  Future<AnagramModel> getAnagramByKeyword();
  Future<bool> isAnagram(String word1, String word2);
  Future<bool> isIsogram(String word);
}

@lazySingleton
@injectable
class AnagramDsImpl implements AnagramDs {
  HerokuClient client = getIt<HerokuClient>();

  @override
  Future<AnagramModel> getAnagramByKeyword() async {
    String url = "http://10.0.2.2:3000/anagram";
    Response response =
        await client.get(url, headers: {"Content-Type": "application/json"});
    // AnagramModel books = AnagramModel();
    String json = response.body;
    List<dynamic> myModels = (jsonDecode(response.body) as List);
//        .map((i) => AnagramModel.fromMap(i))
//        .toList();
    List<Map<String, dynamic>> books = List<Map<String, dynamic>>();
    // List<dynamic> results = jsonDecode(json);

    myModels.forEach((v) {
      books.add(v);
    });
    AnagramModel coba = AnagramModel.fromMap(books[0]);
    return coba;
  }

  @override
  Future<bool> isAnagram(String word1, String word2) async {
    String url = "http://10.0.2.2:3000/anagram";
    List<String> words = [word1, word2];
    Map<String, dynamic> json = {"words": words};
    String jsonBody = jsonEncode(json);
    Response response = await client.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonBody);
    String check = response.body;
    Map<String, dynamic> map = jsonDecode(check);
    return map['isAnagram'];
  }

  @override
  Future<bool> isIsogram(String word) async {
    String url = "http://10.0.2.2:3000/isogram/$word";
    Response response =
        await client.get(url, headers: {"Content-Type": "application/json"});
    String check = response.body;
    Map<String, dynamic> map = jsonDecode(check);
    return map['isIsogram'];
  }
}
