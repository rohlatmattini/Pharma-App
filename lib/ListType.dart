import 'package:meta/meta.dart';
import 'dart:convert';

class ListType {
  List<ListTypeElement> listType;

  ListType({
    required this.listType,
  });

  factory ListType.fromRawJson(String str) => ListType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListType.fromJson(Map<String, dynamic> json) => ListType(
    listType: List<ListTypeElement>.from(json["listType"].map((x) => ListTypeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listType": List<dynamic>.from(listType.map((x) => x.toJson())),
  };
}

class ListTypeElement {
  int id;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  ListTypeElement({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ListTypeElement.fromRawJson(String str) => ListTypeElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListTypeElement.fromJson(Map<String, dynamic> json) => ListTypeElement(
    id: json["id"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
