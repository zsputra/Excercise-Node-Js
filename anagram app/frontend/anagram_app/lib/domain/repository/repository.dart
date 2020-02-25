import 'package:demo_app/data/anagram_backend/repository/AnagramRepoImpl.dart';
import 'package:demo_app/domain/entity/AnagramEntity.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(AnagramRepositoryImpl)
@injectable
abstract class AnagramRepository {
  Future<AnagramEntity> anagramsByKeyword(String keyword);
}
