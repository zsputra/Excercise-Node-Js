import 'package:equatable/equatable.dart';

class BookEntity with EquatableMixin {
  final String id;
  final String title;
  final String url;
  final String image;
  final String pangrams;

  BookEntity({this.id, this.title, this.url, this.image, this.pangrams});

  @override
  List<Object> get props => [id, title, url, image, pangrams];
}

extension BookEntityExt on BookEntity {
  BookEntity copyWith(BookEntity updates) => BookEntity(
        id: updates.id ?? id,
        title: updates.title ?? title,
        url: updates.url ?? url,
        image: updates.image ?? image,
        pangrams: updates.pangrams ?? pangrams,
      );
}
