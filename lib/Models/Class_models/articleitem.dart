class Article {
  int? id;
  String name;
  int task;
  double? price;
  String? shop;
  String? image;

  Article({required this.id,required this.name,required this.task,required this.price,required this.shop,required this.image});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["id"],
      name: json["name"],
      task: json["task"],
      price: json["price"],
      shop: json["shop"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "task": this.task,
      "price": this.price,
      "shop": this.shop,
      "image": this.image,
    };
  }

//

}