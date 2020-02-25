import 'package:demo_app/core/dependency_injection/getit_configuration.iconfig.dart';
import 'package:demo_app/core/utils/use_case.dart';
import 'package:demo_app/data/heroku_book/datasource/angram_remote_ds.dart';
import 'package:demo_app/domain/entities/AnagramEntity.dart';
import 'package:demo_app/domain/entities/book_entity.dart';
import 'package:demo_app/domain/repository/domain_repo.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class GetAllBookUseCase implements UseCase<List<BookEntity>, NoPayload> {
  HerokuRepository herokuRepository = getIt<HerokuRepository>();
  AnagramDs anagramDs = getIt<AnagramDs>();

  GetAllBookUseCase({@required this.herokuRepository});

  @override
  Future<List<BookEntity>> call(NoPayload payload) {
    return herokuRepository.getAllBooks();
  }
}

@lazySingleton
@injectable
class GetListAnagramUseCase implements UseCase<AnagramEntity, NoPayload> {
  HerokuRepository herokuRepository = getIt<HerokuRepository>();

  GetListAnagramUseCase({@required this.herokuRepository});

  @override
  Future<AnagramEntity> call(NoPayload) {
    return herokuRepository.anagramsByKeyword();
  }
}

@lazySingleton
@injectable
class IsAnagramUseCase implements UseCase<bool, Payload> {
  HerokuRepository herokuRepository = getIt<HerokuRepository>();

  IsAnagramUseCase({@required this.herokuRepository});

  @override
  Future<bool> call(Payload) {
    return herokuRepository.isAnagram(Payload.word1, Payload.word2);
  }
}

@lazySingleton
@injectable
class IsIsogramUseCase implements UseCase<bool, Payload> {
  HerokuRepository herokuRepository = getIt<HerokuRepository>();

  IsIsogramUseCase({@required this.herokuRepository});

  @override
  Future<bool> call(Payload) {
    return herokuRepository.isIsogram(Payload.word1);
  }
}

class Payload {
  final String keyword;
  final word1;
  final word2;
  Payload({this.keyword, this.word1, this.word2});
}
