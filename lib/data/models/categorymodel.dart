/*
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.data,
  });

  List<CategoryModelDatum> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: List<CategoryModelDatum>.from(
            json["data"].map((x) => CategoryModelDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryModelDatum {
  CategoryModelDatum({
    required this.id,
    required this.attributes,
  });

  String id;
  PurpleAttributes attributes;

  factory CategoryModelDatum.fromJson(Map<String, dynamic> json) =>
      CategoryModelDatum(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class PurpleAttributes {
  PurpleAttributes({
    required this.cateRate,
    required this.cateImg,
    required this.cateTypes,
    required this.cateName,
  });

  int cateRate;
  CateImg cateImg;
  CateTypes cateTypes;
  String cateName;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        cateRate: json["cate_rate"],
        cateImg: CateImg.fromJson(json["cate_img"]),
        cateTypes: CateTypes.fromJson(json["cate_types"]),
        cateName: json["cate_name"],
      );

  Map<String, dynamic> toJson() => {
        "cate_rate": cateRate,
        "cate_img": cateImg.toJson(),
        "cate_types": cateTypes.toJson(),
        "cate_name": cateName,
      };
}

class CateImg {
  CateImg({
    required this.id,
    required this.attributes,
  });

  String id;
  CateImgAttributes attributes;

  factory CateImg.fromJson(Map<String, dynamic> json) => CateImg(
        id: json["id"],
        attributes: CateImgAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class CateImgAttributes {
  CateImgAttributes({
    required this.name,
    required this.width,
    required this.height,
    required this.url,
    required this.previewUrl,
    required this.related,
  });

  String name;
  int width;
  int height;
  String url;
  String previewUrl;
  Related related;

  factory CateImgAttributes.fromJson(Map<String, dynamic> json) =>
      CateImgAttributes(
        name: json["name"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        previewUrl: json["previewUrl"],
        related: Related.fromJson(json["related"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "width": width,
        "height": height,
        "url": url,
        "previewUrl": previewUrl,
        "related": related.toJson(),
      };
}

class Related {
  Related({
    required this.data,
  });

  List<RelatedDatum> data;

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        data: List<RelatedDatum>.from(
            json["data"].map((x) => RelatedDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RelatedDatum {
  RelatedDatum({
    required this.id,
    required this.attributes,
  });

  String id;
  FluffyAttributes attributes;

  factory RelatedDatum.fromJson(Map<String, dynamic> json) => RelatedDatum(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class FluffyAttributes {
  FluffyAttributes();

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes();

  Map<String, dynamic> toJson() => {};
}

class CateTypes {
  CateTypes({
    required this.data,
  });

  List<CateTypesDatum> data;

  factory CateTypes.fromJson(Map<String, dynamic> json) => CateTypes(
        data: List<CateTypesDatum>.from(
            json["data"].map((x) => CateTypesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CateTypesDatum {
  CateTypesDatum({
    required this.id,
    required this.attributes,
  });

  String id;
  TentacledAttributes attributes;

  factory CateTypesDatum.fromJson(Map<String, dynamic> json) => CateTypesDatum(
        id: json["id"],
        attributes: TentacledAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class TentacledAttributes {
  TentacledAttributes({
    required this.proName,
    required this.proProcess,
    required this.proArea,
    required this.proRooms,
    required this.proPaths,
    required this.proKetchin,
    required this.proPrice,
    required this.proLocation,
    required this.proDetails,
    required this.proImg,
    required this.proLate,
    required this.proLang,
  });

  String proName;
  String proProcess;
  int proArea;
  int proRooms;
  int proPaths;
  int proKetchin;
  int proPrice;
  String proLocation;
  String proDetails;
  ProImg proImg;
  String proLate;
  String proLang;

  factory TentacledAttributes.fromJson(Map<String, dynamic> json) =>
      TentacledAttributes(
        proName: json["pro_name"],
        proProcess: json["pro_process"],
        proArea: json["pro_area"],
        proRooms: json["pro_rooms"],
        proPaths: json["pro_paths"],
        proKetchin: json["pro_ketchin"],
        proPrice: json["pro_price"],
        proLocation: json["pro_location"],
        proDetails: json["pro_details"],
        proImg: ProImg.fromJson(json["pro_img"]),
        proLate: json["pro_late"],
        proLang: json["pro_lang"],
      );

  Map<String, dynamic> toJson() => {
        "pro_name": proName,
        "pro_process": proProcess,
        "pro_area": proArea,
        "pro_rooms": proRooms,
        "pro_paths": proPaths,
        "pro_ketchin": proKetchin,
        "pro_price": proPrice,
        "pro_location": proLocation,
        "pro_details": proDetails,
        "pro_img": proImg.toJson(),
        "pro_late": proLate,
        "pro_lang": proLang,
      };
}

class ProImg {
  ProImg({
    required this.data,
  });

  List<ProImgDatum> data;

  factory ProImg.fromJson(Map<String, dynamic> json) => ProImg(
        data: List<ProImgDatum>.from(
            json["data"].map((x) => ProImgDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProImgDatum {
  ProImgDatum({
    required this.id,
    required this.attributes,
  });

  String id;
  StickyAttributes attributes;

  factory ProImgDatum.fromJson(Map<String, dynamic> json) => ProImgDatum(
        id: json["id"],
        attributes: StickyAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class StickyAttributes {
  StickyAttributes({
    required this.width,
    required this.height,
    required this.size,
    required this.url,
    required this.previewUrl,
  });

  int width;
  int height;
  int size;
  String url;
  String previewUrl;

  factory StickyAttributes.fromJson(Map<String, dynamic> json) =>
      StickyAttributes(
        width: json["width"],
        height: json["height"],
        size: json["size"],
        url: json["url"],
        previewUrl: json["previewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
      };
}
*/
// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.data,
  });

  Data data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  int id;
  DataAttributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DataAttributes {
  DataAttributes({
    required this.cateRate,
    required this.cateName,
    required this.cateImg,
  });

  double cateRate;
  String cateName;
  CateImg cateImg;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        cateRate: json["cate_rate"].toDouble(),
        cateName: json["cate_name"],
        cateImg: CateImg.fromJson(json["cate_img"]),
      );

  Map<String, dynamic> toJson() => {
        "cate_rate": cateRate,
        "cate_name": cateName,
        "cate_img": cateImg.toJson(),
      };
}

class CateImg {
  CateImg({
    required this.data,
  });

  List<Datum> data;

  factory CateImg.fromJson(Map<String, dynamic> json) => CateImg(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

  int id;
  DatumAttributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DatumAttributes {
  DatumAttributes({
    required this.name,
    required this.url,
    required this.provider,
  });

  String name;
  String url;
  String provider;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        name: json["name"],
        url: json["url"],
        provider: json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "provider": provider,
      };
}
