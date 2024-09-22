import 'package:meta/meta.dart';
import 'dart:convert';

class Products {
  List<SearchList> searchList;

  Products({
    required this.searchList,
  });

  factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    searchList: List<SearchList>.from(json["search list"].map((x) => SearchList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "search list": List<dynamic>.from(searchList.map((x) => x.toJson())),
  };
}

class SearchList {
  int id;
  int ownerId;
  String composition;
  String name;
  String type;
  String manufactureCompany;
  int quantity;
  DateTime expirationDate;
  int price;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  SearchList({
    required this.id,
    required this.ownerId,
    required this.composition,
    required this.name,
    required this.type,
    required this.manufactureCompany,
    required this.quantity,
    required this.expirationDate,
    required this.price,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SearchList.fromRawJson(String str) => SearchList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchList.fromJson(Map<String, dynamic> json) => SearchList(
    id: json["id"],
    ownerId: json["owner_id"],
    composition: json["composition"],
    name: json["name"],
    type: json["type"],
    manufactureCompany: json["manufacture_company"],
    quantity: json["quantity"],
    expirationDate: DateTime.parse(json["expiration_date"]),
    price: json["price"],
    rememberToken: json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "composition": composition,
    "name": name,
    "type": type,
    "manufacture_company": manufactureCompany,
    "quantity": quantity,
    "expiration_date": "${expirationDate.year.toString().padLeft(4, '0')}-${expirationDate.month.toString().padLeft(2, '0')}-${expirationDate.day.toString().padLeft(2, '0')}",
    "price": price,
    "remember_token": rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
