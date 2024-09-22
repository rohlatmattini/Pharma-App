import 'package:meta/meta.dart';
import 'dart:convert';

class Orderlist {
  List<UserOrder> userOrders;

  Orderlist({
    required this.userOrders,
  });

  factory Orderlist.fromRawJson(String str) => Orderlist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Orderlist.fromJson(Map<String, dynamic> json) => Orderlist(
    userOrders: List<UserOrder>.from(json["user_orders"].map((x) => UserOrder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_orders": List<dynamic>.from(userOrders.map((x) => x.toJson())),
  };
}

class UserOrder {
  int id;
  int userId;
  int productId;
  String name;
  int price;
  int quantity;
  int ownerId;
  String status;
  String payment;
  DateTime createdAt;
  DateTime updatedAt;

  UserOrder({
    required this.id,
    required this.userId,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.ownerId,
    required this.status,
    required this.payment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserOrder.fromRawJson(String str) => UserOrder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserOrder.fromJson(Map<String, dynamic> json) => UserOrder(
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    name: json["name"],
    price: json["price"],
    quantity: json["quantity"],
    ownerId: json["owner_id"],
    status: json["status"],
    payment: json["payment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "name": name,
    "price": price,
    "quantity": quantity,
    "owner_id": ownerId,
    "status": status,
    "payment": payment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
