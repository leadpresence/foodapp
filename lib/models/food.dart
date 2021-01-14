import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'category.dart';

class FoodList {
  List<Food> foods;
  FoodList({
    this.foods,
  });

  FoodList copyWith({
    List<Food> foods,
  }) {
    return FoodList(
      foods: foods ?? this.foods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'foods': foods?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FoodList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return FoodList(
      foods: List<Food>.from(map['foods']?.map((x) => Food.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodList.fromJson(String source) => FoodList.fromMap(json.decode(source));

  @override
  String toString() => 'FoodList(foods: $foods)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is FoodList &&
      listEquals(o.foods, foods);
  }

  @override
  int get hashCode => foods.hashCode;
}

class Food {
  final FCategory vegetables;
  final FCategory dairy;
  final FCategory protein;
  Food({
    this.vegetables,
    this.dairy,
    this.protein,
  });

  Food copyWith({
    FCategory vegetables,
    FCategory dairy,
    FCategory protein,
  }) {
    return Food(
      vegetables: vegetables ?? this.vegetables,
      dairy: dairy ?? this.dairy,
      protein: protein ?? this.protein,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vegetables': vegetables?.toMap(),
      'dairy': dairy?.toMap(),
      'protein': protein?.toMap(),
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Food(
      vegetables: FCategory.fromMap(map['vegetables']),
      dairy: FCategory.fromMap(map['dairy']),
      protein: FCategory.fromMap(map['protein']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  @override
  String toString() =>
      'Food(vegetables: $vegetables, dairy: $dairy, protein: $protein)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Food &&
        o.vegetables == vegetables &&
        o.dairy == dairy &&
        o.protein == protein;
  }

  @override
  int get hashCode => vegetables.hashCode ^ dairy.hashCode ^ protein.hashCode;
}
