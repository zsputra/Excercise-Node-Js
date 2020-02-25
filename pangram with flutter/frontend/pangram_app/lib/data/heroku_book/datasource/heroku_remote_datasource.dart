import 'dart:convert';

import 'package:demo_app/core/dependency_injection/getit_configuration.iconfig.dart';
import 'package:demo_app/core/network/heroku_client.dart';
import 'package:demo_app/data/heroku_book/model/book_model.dart';
import 'package:injectable/injectable.dart';

const HEROKU_URL = "https://pangram-service.herokuapp.com/pangram";

@Bind.toType(HerokuBookRemoteDsImpl)
@injectable
abstract class HerokuBookRemoteDs {
  Future<List<BookModel>> getAllBook();
}

@injectable
@lazySingleton
class HerokuBookRemoteDsImpl implements HerokuBookRemoteDs {
  HerokuClient herokuClient = getIt<HerokuClient>();
  @override
  Future<List<BookModel>> getAllBook() async {
    final response = await herokuClient.get(HEROKU_URL, headers: {
      "Content-Type": "application/json",
    });
    String json = response.body;
    List<BookModel> books = List<BookModel>();
    List<dynamic> results = jsonDecode(json);
    results.forEach((v) {
      books.add(BookModel.fromJson(v));
    });
    return books;
  }
}
