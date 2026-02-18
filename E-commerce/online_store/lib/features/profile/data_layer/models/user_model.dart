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
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
    );
  }

  static List<User> fromJsonList(Map<String, dynamic> json) {
    List<User> user = [];
    json['data'].forEach((element) => user.add(User.fromJson(element)));
    return user;
  }
}
