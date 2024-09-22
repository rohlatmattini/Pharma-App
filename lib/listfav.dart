import 'package:meta/meta.dart';
import 'dart:convert';

class Favourite {
  List<Favorite> favorites;

  Favourite({
    required this.favorites,
  });

  factory Favourite.fromRawJson(String str) => Favourite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
    favorites: List<Favorite>.from(json["favorites"].map((x) => Favorite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "favorites": List<dynamic>.from(favorites.map((x) => x.toJson())),
  };
}

class Favorite {
  int id;
  int userId;
  int productId;
  String name;
  String composition;
  String manufactureCompany;
  String type;
  int quantity;
  int price;
  int ownerId;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  Favorite({
    required this.id,
    required this.userId,
    required this.productId,
    required this.name,
    required this.composition,
    required this.manufactureCompany,
    required this.quantity,
    required this.type,
    required this.price,
    required this.ownerId,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Favorite.fromRawJson(String str) => Favorite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    type:json["type"],
    name: json["name"],
    composition: json["composition"],
    manufactureCompany: json["manufacture_company"],
    quantity: json["quantity"],
    price: json["price"],
    ownerId: json["owner_id"],
    rememberToken: json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "name": name,
    "composition": composition,
    "manufacture_company": manufactureCompany,
    "quantity": quantity,
    "price": price,
    "owner_id": ownerId,
    "remember_token": rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
