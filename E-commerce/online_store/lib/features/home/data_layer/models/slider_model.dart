class SliderModel {
  final int id;
  final String title;
  final String image;

  SliderModel({required this.id, required this.title, required this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }

  static List<SliderModel> fromJsonList(Map<String, dynamic> json) {
    List<SliderModel> sliders = [];
    json['data'].forEach((e) => sliders.add(SliderModel.fromJson(e)));
    return sliders;
  }
}
