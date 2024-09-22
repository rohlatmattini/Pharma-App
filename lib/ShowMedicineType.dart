import 'package:meta/meta.dart';
import 'dart:convert';

class MedicineType {
  List<TypeList> typeList;

  MedicineType({
    required this.typeList,
  });

  factory MedicineType.fromRawJson(String str) => MedicineType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicineType.fromJson(Map<String, dynamic> json) => MedicineType(
    typeList: List<TypeList>.from(json["type list"].map((x) => TypeList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type list": List<dynamic>.from(typeList.map((x) => x.toJson())),
  };
}

class TypeList {
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

  TypeList({
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

  factory TypeList.fromRawJson(String str) => TypeList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeList.fromJson(Map<String, dynamic> json) => TypeList(
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
