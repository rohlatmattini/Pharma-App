import 'package:meta/meta.dart';
import 'dart:convert';

class Show1 {
  List<ListElement> list;

  Show1({
    required this.list,
  });

  factory Show1.fromRawJson(String str) => Show1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Show1.fromJson(Map<String, dynamic> json) => Show1(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  int id;
  String composition;
  String name;
  String type;
  String manufactureCompany;
  int quantity;
  String expirationDate;
  int price;
  //dynamic rememberToken;
  // DateTime createdAt;
  // DateTime updatedAt;

  ListElement({
    required this.id,
    required this.composition,
    required this.name,
    required this.type,
    required this.manufactureCompany,
    required this.quantity,
    required this.expirationDate,
    required this.price,
    //required this.rememberToken,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory ListElement.fromRawJson(String str) => ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    composition: json["composition"],
    name: json["name"],
    type: json["type"],
    manufactureCompany: json["manufacture_company"],
    quantity: json["quantity"],
    expirationDate: json["expiration_date"],
    price: json["price"],
    //rememberToken: json["remember_token"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "composition": composition,
    "name": name,
    "type": type,
    "manufacture_company": manufactureCompany,
    "quantity": quantity,
    "expiration_date": expirationDate,
    "price": price,
    //"remember_token": rememberToken,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}
