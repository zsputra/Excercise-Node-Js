import 'package:demo_app/domain/entity/AnagramEntity.dart';

class AnagramModel extends AnagramEntity {
  AnagramModel({String id, int count, List<String> data})
      : super(id: id, count: count, data: data);

  factory AnagramModel.fromMap(Map<String, dynamic> json) {
    return AnagramModel(
        id: json['_id'], count: json['count'], data: json['data']);
  }

  Map<String, dynamic> toMap(AnagramModel model) {
    return {"_id": model.id, "count": model.count, "data": model.data};
  }
}
