import 'package:online_store/core/utils/parse_helper.dart';

class CategoryModel {
  final int id;
  final String name;
  final String? image;

  CategoryModel({required this.id, required this.name, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final data = ParseHelper.mapOf(json);
    return CategoryModel(
      id: ParseHelper.toInt(data['id']),
      name: ParseHelper.text(data['name']),
      image: ParseHelper.imageUrl(data['image']),
    );
  }

  static List<CategoryModel> fromJsonList(Map<String, dynamic> json) {
    return ParseHelper.mapList(json['data'])
        .map(CategoryModel.fromJson)
        .toList();
  }
}
