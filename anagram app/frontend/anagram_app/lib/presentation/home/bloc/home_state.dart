part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

@immutable
class HomeInitial extends HomeState {}

@immutable
class GetAnagram extends HomeState {}
