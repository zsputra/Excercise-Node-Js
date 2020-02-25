import 'package:demo_app/core/dependency_injection/getit_configuration.iconfig.dart';
import 'package:demo_app/data/heroku_book/datasource/angram_remote_ds.dart';
import 'package:demo_app/data/heroku_book/datasource/heroku_remote_datasource.dart';
import 'package:demo_app/domain/entities/AnagramEntity.dart';
import 'package:demo_app/domain/entities/book_entity.dart';
import 'package:demo_app/domain/repository/domain_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class HerokuRepositoryImpl implements HerokuRepository {
  HerokuBookRemoteDs herokuBookRemoteDs = getIt<HerokuBookRemoteDs>();
  AnagramDs anagramDs = getIt<AnagramDs>();
  @override
  Future<List<BookEntity>> getAllBooks() {
    return herokuBookRemoteDs.getAllBook();
  }

  @override
  Future<AnagramEntity> anagramsByKeyword() {
    return anagramDs.getAnagramByKeyword();
  }

  @override
  Future<bool> isAnagram(String word1, String word2) {
    return anagramDs.isAnagram(word1, word2);
  }

  @override
  Future<bool> isIsogram(String word) {
    return anagramDs.isIsogram(word);
  }
}
