import 'package:online_store/core/utils/parse_helper.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String? token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var data = ParseHelper.mapOf(json);
    if (data['data'] is Map) {
      data = ParseHelper.mapOf(data['data']);
    }
    return User(
      id: ParseHelper.toInt(data['id']),
      name: ParseHelper.text(data['name']),
      email: ParseHelper.text(data['email']),
      phone: ParseHelper.text(data['phone']),
      image: ParseHelper.imageUrl(data['image'] ?? data['avatar']),
      token: data['token']?.toString(),
    );
  }

  static List<User> fromJsonList(Map<String, dynamic> json) {
    return ParseHelper.mapList(json['data']).map(User.fromJson).toList();
  }
}
