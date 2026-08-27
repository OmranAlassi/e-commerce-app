import 'package:online_store/core/utils/parse_helper.dart';

class SliderModel {
  final int id;
  final String title;
  final String image;

  SliderModel({required this.id, required this.title, required this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    final data = ParseHelper.mapOf(json);
    return SliderModel(
      id: ParseHelper.toInt(data['id']),
      title: ParseHelper.text(data['title']),
      image: ParseHelper.imageUrl(data['image']),
    );
  }

  static List<SliderModel> fromJsonList(Map<String, dynamic> json) {
    return ParseHelper.mapList(json['data']).map(SliderModel.fromJson).toList();
  }
}
