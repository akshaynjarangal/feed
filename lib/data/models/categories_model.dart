// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'categories_model.g.dart';

List<CategoriesModel> categoriesModelFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class CategoriesModel {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "title")
    final String? title;
    @JsonKey(name: "image")
    final String? image;

    CategoriesModel({
        this.id,
        this.title,
        this.image,
    });

    CategoriesModel copyWith({
        int? id,
        String? title,
        String? image,
    }) => 
        CategoriesModel(
            id: id ?? this.id,
            title: title ?? this.title,
            image: image ?? this.image,
        );

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

    Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
