import 'dart:convert';

class UserModel {
    UserModel({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.shopId,
        this.profile,
        this.address,
        this.shops,
        this.managedShop,
    });

    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int isActive;
    dynamic shopId;
    dynamic profile;
    List<dynamic> address;
    List<dynamic> shops;
    dynamic managedShop;

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        shopId: json["shop_id"],
        profile: json["profile"],
        address: List<dynamic>.from(json["address"].map((x) => x)),
        shops: List<dynamic>.from(json["shops"].map((x) => x)),
        managedShop: json["managed_shop"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "shop_id": shopId,
        "profile": profile,
        "address": List<dynamic>.from(address.map((x) => x)),
        "shops": List<dynamic>.from(shops.map((x) => x)),
        "managed_shop": managedShop,
    };
}
