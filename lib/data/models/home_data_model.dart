// To parse this JSON data, do
//
//     final homeDataModel = homeDataModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'home_data_model.g.dart';

HomeDataModel homeDataModelFromJson(String str) => HomeDataModel.fromJson(json.decode(str));

String homeDataModelToJson(HomeDataModel data) => json.encode(data.toJson());

@JsonSerializable()
class HomeDataModel {
    @JsonKey(name: "user")
    final List<dynamic>? user;
    @JsonKey(name: "banners")
    final List<Banner>? banners;
    @JsonKey(name: "category_dict")
    final List<CategoryDict>? categoryDict;
    @JsonKey(name: "results")
    final List<Result>? results;
    @JsonKey(name: "status")
    final bool? status;
    @JsonKey(name: "next")
    final bool? next;

    HomeDataModel({
        this.user,
        this.banners,
        this.categoryDict,
        this.results,
        this.status,
        this.next,
    });

    HomeDataModel copyWith({
        List<dynamic>? user,
        List<Banner>? banners,
        List<CategoryDict>? categoryDict,
        List<Result>? results,
        bool? status,
        bool? next,
    }) => 
        HomeDataModel(
            user: user ?? this.user,
            banners: banners ?? this.banners,
            categoryDict: categoryDict ?? this.categoryDict,
            results: results ?? this.results,
            status: status ?? this.status,
            next: next ?? this.next,
        );

    factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);

    Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}

@JsonSerializable()
class Banner {
    @JsonKey(name: "image")
    final String? image;

    Banner({
        this.image,
    });

    Banner copyWith({
        String? image,
    }) => 
        Banner(
            image: image ?? this.image,
        );

    factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

    Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable()
class CategoryDict {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "title")
    final String? title;

    CategoryDict({
        this.id,
        this.title,
    });

    CategoryDict copyWith({
        String? id,
        String? title,
    }) => 
        CategoryDict(
            id: id ?? this.id,
            title: title ?? this.title,
        );

    factory CategoryDict.fromJson(Map<String, dynamic> json) => _$CategoryDictFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryDictToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "description")
    final String? description;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "video")
    final String? video;
    @JsonKey(name: "likes")
    final List<int>? likes;
    @JsonKey(name: "dislikes")
    final List<int>? dislikes;
    @JsonKey(name: "bookmarks")
    final List<int>? bookmarks;
    @JsonKey(name: "hide")
    final List<int>? hide;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "follow")
    final bool? follow;
    @JsonKey(name: "user")
    final User? user;

    Result({
        this.id,
        this.description,
        this.image,
        this.video,
        this.likes,
        this.dislikes,
        this.bookmarks,
        this.hide,
        this.createdAt,
        this.follow,
        this.user,
    });

    Result copyWith({
        int? id,
        String? description,
        String? image,
        String? video,
        List<int>? likes,
        List<int>? dislikes,
        List<int>? bookmarks,
        List<int>? hide,
        DateTime? createdAt,
        bool? follow,
        User? user,
    }) => 
        Result(
            id: id ?? this.id,
            description: description ?? this.description,
            image: image ?? this.image,
            video: video ?? this.video,
            likes: likes ?? this.likes,
            dislikes: dislikes ?? this.dislikes,
            bookmarks: bookmarks ?? this.bookmarks,
            hide: hide ?? this.hide,
            createdAt: createdAt ?? this.createdAt,
            follow: follow ?? this.follow,
            user: user ?? this.user,
        );

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "image")
    final String? image;

    User({
        this.id,
        this.name,
        this.image,
    });

    User copyWith({
        int? id,
        String? name,
        String? image,
    }) => 
        User(
            id: id ?? this.id,
            name: name ?? this.name,
            image: image ?? this.image,
        );

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
