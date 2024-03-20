// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) =>
    HomeDataModel(
      user: json['user'] as List<dynamic>?,
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryDict: (json['category_dict'] as List<dynamic>?)
          ?.map((e) => CategoryDict.fromJson(e as Map<String, dynamic>))
          .toList(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      next: json['next'] as bool?,
    );

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'banners': instance.banners,
      'category_dict': instance.categoryDict,
      'results': instance.results,
      'status': instance.status,
      'next': instance.next,
    };

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'image': instance.image,
    };

CategoryDict _$CategoryDictFromJson(Map<String, dynamic> json) => CategoryDict(
      id: json['id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CategoryDictToJson(CategoryDict instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      video: json['video'] as String?,
      likes: (json['likes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      dislikes:
          (json['dislikes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      bookmarks:
          (json['bookmarks'] as List<dynamic>?)?.map((e) => e as int).toList(),
      hide: (json['hide'] as List<dynamic>?)?.map((e) => e as int).toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      follow: json['follow'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'video': instance.video,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'bookmarks': instance.bookmarks,
      'hide': instance.hide,
      'created_at': instance.createdAt?.toIso8601String(),
      'follow': instance.follow,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
