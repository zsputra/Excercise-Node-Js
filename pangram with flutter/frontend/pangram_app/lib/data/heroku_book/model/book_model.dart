import 'package:demo_app/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  BookModel({
    String id,
    String title,
    String url,
    String image,
    String pangrams,
  }) : super(id: id, title: title, url: url, image: image, pangrams: pangrams);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        image: json['image'],
        pangrams: json['pangrams']);
  }

  Map<String, dynamic> toJson(BookModel bookModel) {
    return {
      "id": bookModel.id,
      "title": bookModel.title,
      "url": bookModel.url,
      "image": bookModel.image,
      "pangrams": bookModel.pangrams
    };
  }
}
