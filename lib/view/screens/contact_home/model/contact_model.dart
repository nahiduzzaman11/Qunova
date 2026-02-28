import 'dart:convert';

/// =============================
/// ContactModel (Root)
/// =============================
class ContactModel {
  String? status;
  String? message;
  Data? data;

  ContactModel({
    this.status,
    this.message,
    this.data,
  });

  factory ContactModel.fromRawJson(String str) =>
      ContactModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

/// =============================
/// Data
/// =============================
class Data {
  List<Category> categories;
  List<Contact> contacts;

  Data({
    required this.categories,
    required this.contacts,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      categories: json["categories"] != null
          ? List<Category>.from(
          json["categories"].map((x) => Category.fromJson(x)))
          : [],
      contacts: json["contacts"] != null
          ? List<Contact>.from(
          json["contacts"].map((x) => Contact.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    "categories":
    List<dynamic>.from(categories.map((x) => x.toJson())),
    "contacts":
    List<dynamic>.from(contacts.map((x) => x.toJson())),
  };
}

/// =============================
/// Category
/// =============================
class Category {
  String? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

/// =============================
/// Contact
/// =============================
class Contact {
  String? id;
  bool? isEmpty;
  String? name;
  String? phone;
  String? categoryId;
  String? avatarUrl;
  String? subtitle;
  String? status;
  DateTime? createdAt;

  Contact({
    this.id,
    this.isEmpty,
    this.name,
    this.phone,
    this.categoryId,
    this.avatarUrl,
    this.subtitle,
    this.status,
    this.createdAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json["id"],
      isEmpty: json["isEmpty"],
      name: json["name"],
      phone: json["phone"],
      categoryId: json["categoryId"],
      avatarUrl: json["avatarUrl"],
      subtitle: json["subtitle"],
      status: json["status"],
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "isEmpty": isEmpty,
    "name": name,
    "phone": phone,
    "categoryId": categoryId,
    "avatarUrl": avatarUrl,
    "subtitle": subtitle,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}