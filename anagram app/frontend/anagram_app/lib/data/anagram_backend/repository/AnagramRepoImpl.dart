import 'package:demo_app/core/dependency_configuration/getit_configuration.dart';
import 'package:demo_app/data/anagram_backend/datasource/angram_remote_ds.dart';
import 'package:demo_app/domain/entity/AnagramEntity.dart';
import 'package:demo_app/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class AnagramRepositoryImpl implements AnagramRepository {
  AnagramDs anagramDs = getIt<AnagramDs>();
  @override
  Future<AnagramEntity> anagramsByKeyword(String keyword) {
    return anagramDs.getAnagramByKeyword(keyword);
  }
}
