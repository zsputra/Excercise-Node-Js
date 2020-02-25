import 'dart:convert';

import 'package:demo_app/core/dependency_configuration/getit_configuration.dart';
import 'package:demo_app/core/network/network_client.dart';
import 'package:demo_app/data/anagram_backend/model/AnagramModel.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(AnagramDsImpl)
@injectable
abstract class AnagramDs {
  Future<AnagramModel> getAnagramByKeyword(String keyword);
}

@lazySingleton
@injectable
class AnagramDsImpl implements AnagramDs {
  BackendClient client = getIt<BackendClient>();
  @override
  Future<AnagramModel> getAnagramByKeyword(String keyword) async {
    String url = "http://10.0.0.2:3000/anagram/$keyword";
    Response response =
        await client.get(url, headers: {"Content-Type": "application/json"});
    Map<String, dynamic> json = jsonDecode(response.body);
    return AnagramModel.fromMap(json);
  }
}
