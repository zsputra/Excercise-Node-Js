part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

@immutable
class HomeInitial extends HomeState {}

@immutable
class GetAllBookState extends HomeState {
  final List<BookEntity> books;
  GetAllBookState(this.books);
}

@immutable
class GetAnagramListState extends HomeState {
  final AnagramEntity anagrams;
  GetAnagramListState(this.anagrams);

  @override
  List<Object> get props => [anagrams];
}

@immutable
class IsAnagramState extends HomeState {
  final bool isAnagram;
  IsAnagramState(this.isAnagram);
}

@immutable
class IsIsogramState extends HomeState {
  final bool isIsogram;
  IsIsogramState(this.isIsogram);
}
