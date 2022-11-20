import '../Enum_models/enum_status.dart';

class ItemList{
  int id;
  String title;
  String status;

  ItemList({required this.status,required this.id,required this.title});

  factory ItemList.fromJson(Map<String, dynamic> json) {
    return ItemList(
      id: json["id"],
      title: json["title"],
      status: json["status"],
    );
  }
//

}