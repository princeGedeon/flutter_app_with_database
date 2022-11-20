class Article {
  int id;
  String name;
  int task;
  double? price;
  String? shop;
  String? image;

  Article({required this.id,required this.name,required this.task,required this.price,required this.shop,required this.image});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: int.parse(json["id"]),
      name: json["name"],
      task: int.parse(json["task"]),
      price: double.parse(json["price"]),
      shop: json["shop"],
      image: json["image"],
    );
  }
//

}