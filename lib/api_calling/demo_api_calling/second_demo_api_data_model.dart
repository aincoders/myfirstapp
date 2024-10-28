class SecondDemoApiDataModel {
  final int id;
  final String? name;
  final String? title;
  final String? image;
  final int? count;
  final double? price;

  SecondDemoApiDataModel({
    required this.id,
    this.name,
    this.title,
    this.image,
    this.price,
    this.count,
  });

  factory SecondDemoApiDataModel.fromJson(Map<String, dynamic> json) {
    return SecondDemoApiDataModel(
        id: json['id'],
        name: json['name'],
        title: json['title'],
        image: json['image'],
        price: json['price'].toDouble(),
        count: json['count']);
  }
}
