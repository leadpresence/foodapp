import 'dart:convert';

import 'package:flutter/foundation.dart';

class FCategoryList {
  List<FCategory> categories;
  FCategoryList({
    this.categories,
  });

  FCategoryList copyWith({
    List<FCategory> categories,
  }) {
    return FCategoryList(
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categories': categories?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FCategoryList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return FCategoryList(
      categories: List<FCategory>.from(map['categories']?.map((x) => FCategory.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FCategoryList.fromJson(String source) => FCategoryList.fromMap(json.decode(source));

  @override
  String toString() => 'FCategoryList(categories: $categories)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is FCategoryList &&
      listEquals(o.categories, categories);
  }

  @override
  int get hashCode => categories.hashCode;
}

class FCategory {
  int id;
  String name;
  String details;
  String price;
  bool isliked;
  String imgurl;
  FCategory({
    this.id,
    this.name,
    this.details,
    this.price,
    this.isliked,
    this.imgurl,
  });

  FCategory copyWith({
    int id,
    String name,
    String details,
    String price,
    bool isliked,
    String imgurl,
  }) {
    return FCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
      price: price ?? this.price,
      isliked: isliked ?? this.isliked,
      imgurl: imgurl ?? this.imgurl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'price': price,
      'isliked': isliked,
      'imgurl': imgurl,
    };
  }

  factory FCategory.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FCategory(
      id: map['id'],
      name: map['name'],
      details: map['details'],
      price: map['price'],
      isliked: map['isliked'],
      imgurl: map['imgurl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FCategory.fromJson(String source) =>
      FCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FCategory(id: $id, name: $name, details: $details, price: $price, isliked: $isliked, imgurl: $imgurl)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FCategory &&
        o.id == id &&
        o.name == name &&
        o.details == details &&
        o.price == price &&
        o.isliked == isliked &&
        o.imgurl == imgurl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        details.hashCode ^
        price.hashCode ^
        isliked.hashCode ^
        imgurl.hashCode;
  }
}
