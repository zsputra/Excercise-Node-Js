import 'package:equatable/equatable.dart';

class AnagramEntity with EquatableMixin {
  final String id;
  final int count;
  final List<String> data;

  AnagramEntity({this.id, this.count, this.data});

  @override
  List<Object> get props {
    return [id, count, data];
  }
}

extension AnagramEntityExt on AnagramEntity {
  AnagramEntity copyWith(AnagramEntity updated) => AnagramEntity(
      id: updated.id ?? id,
      count: updated.count ?? count,
      data: updated.data ?? data);
}
