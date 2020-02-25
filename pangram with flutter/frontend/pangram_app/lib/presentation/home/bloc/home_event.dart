part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

@immutable
class GetAllBookEvent extends HomeEvent {}

@immutable
class GetListAnagramEvent extends HomeEvent {}

@immutable
class IsAnagramEvent extends HomeEvent {
  final String word1;
  final String word2;
  IsAnagramEvent(this.word1, this.word2);
}

@immutable
class IsIsogramEvent extends HomeEvent {
  final String word;
  IsIsogramEvent(this.word);
}
