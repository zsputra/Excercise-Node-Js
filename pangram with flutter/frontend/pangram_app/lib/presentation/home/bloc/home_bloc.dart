import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/core/dependency_injection/getit_configuration.iconfig.dart';
import 'package:demo_app/core/utils/use_case.dart';
import 'package:demo_app/domain/entities/AnagramEntity.dart';
import 'package:demo_app/domain/entities/book_entity.dart';
import 'package:demo_app/domain/home/use_case/get_all_book_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetAllBookUseCase getAllBookUseCase = getIt<GetAllBookUseCase>();
  GetListAnagramUseCase getListAnagramUseCase = getIt<GetListAnagramUseCase>();
  IsAnagramUseCase isAnagramUseCase = getIt<IsAnagramUseCase>();
  IsIsogramUseCase isIsogramUseCase = getIt<IsIsogramUseCase>();

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetAllBookEvent) {
      List<BookEntity> books = await getAllBookUseCase(NoPayload());
      yield GetAllBookState(books);
    } else if (event is GetListAnagramEvent) {
      AnagramEntity anagram = await getListAnagramUseCase(NoPayload());
      yield GetAnagramListState(anagram);
    } else if (event is IsAnagramEvent) {
      String word1 = event.word1;
      String word2 = event.word2;
      bool isAnagram =
          await isAnagramUseCase(Payload(word1: word1, word2: word2));
      yield IsAnagramState(isAnagram);
    } else if (event is IsIsogramEvent) {
      String word = event.word;
      bool isIsogram = await isIsogramUseCase(Payload(word1: word));
      yield IsIsogramState(isIsogram);
    }
  }
}
