import 'package:demo_app/data/heroku_book/repository/repository.dart';
import 'package:demo_app/domain/entities/AnagramEntity.dart';
import 'package:demo_app/domain/entities/book_entity.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(HerokuRepositoryImpl)
@injectable
abstract class HerokuRepository {
  Future<List<BookEntity>> getAllBooks();
  Future<AnagramEntity> anagramsByKeyword();
  Future<bool> isAnagram(String word1, String word2);
  Future<bool> isIsogram(String word);
}
