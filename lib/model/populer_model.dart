// To parse this JSON data, do
//
//     final populerModel = populerModelFromJson(jsonString);

/**
 * ?? API DATA FROM 
 * ?? ===[ NEWSAPI.AI ]====
 */

import 'dart:convert';

PopulerModel populerModelFromJson(String str) =>
    PopulerModel.fromJson(json.decode(str));

String populerModelToJson(PopulerModel data) => json.encode(data.toJson());

class PopulerModel {
  Articles? articles;

  PopulerModel({
    this.articles,
  });

  factory PopulerModel.fromJson(Map<String, dynamic> json) => PopulerModel(
        articles: json["articles"] == null
            ? null
            : Articles.fromJson(json["articles"]),
      );

  Map<String, dynamic> toJson() => {
        "articles": articles?.toJson(),
      };
}

class Articles {
  List<Result>? results;
  int? totalResults;
  int? page;
  int? count;
  int? pages;

  Articles({
    this.results,
    this.totalResults,
    this.page,
    this.count,
    this.pages,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        totalResults: json["totalResults"],
        page: json["page"],
        count: json["count"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "totalResults": totalResults,
        "page": page,
        "count": count,
        "pages": pages,
      };
}

class Result {
  String? uri;
  Lang? lang;
  bool? isDuplicate;
  DateTime? date;
  String? time;
  DateTime? dateTime;
  DateTime? dateTimePub;
  DataType? dataType;
  double? sim;
  String? url;
  String? title;
  String? body;
  Source? source;
  List<Author>? authors;
  String? image;
  String? eventUri;
  double? sentiment;
  int? wgt;
  int? relevance;

  Result({
    this.uri,
    this.lang,
    this.isDuplicate,
    this.date,
    this.time,
    this.dateTime,
    this.dateTimePub,
    this.dataType,
    this.sim,
    this.url,
    this.title,
    this.body,
    this.source,
    this.authors,
    this.image,
    this.eventUri,
    this.sentiment,
    this.wgt,
    this.relevance,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uri: json["uri"],
        lang: langValues.map[json["lang"]]!,
        isDuplicate: json["isDuplicate"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        dateTime:
            json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        dateTimePub: json["dateTimePub"] == null
            ? null
            : DateTime.parse(json["dateTimePub"]),
        dataType: dataTypeValues.map[json["dataType"]]!,
        sim: json["sim"]?.toDouble(),
        url: json["url"],
        title: json["title"],
        body: json["body"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        authors: json["authors"] == null
            ? []
            : List<Author>.from(
                json["authors"]!.map((x) => Author.fromJson(x))),
        image: json["image"],
        eventUri: json["eventUri"],
        sentiment: json["sentiment"]?.toDouble(),
        wgt: json["wgt"],
        relevance: json["relevance"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "lang": langValues.reverse[lang],
        "isDuplicate": isDuplicate,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "dateTime": dateTime?.toIso8601String(),
        "dateTimePub": dateTimePub?.toIso8601String(),
        "dataType": dataTypeValues.reverse[dataType],
        "sim": sim,
        "url": url,
        "title": title,
        "body": body,
        "source": source?.toJson(),
        "authors": authors == null
            ? []
            : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "image": image,
        "eventUri": eventUri,
        "sentiment": sentiment,
        "wgt": wgt,
        "relevance": relevance,
      };
}

class Author {
  String? uri;
  String? name;
  Type? type;
  bool? isAgency;

  Author({
    this.uri,
    this.name,
    this.type,
    this.isAgency,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        uri: json["uri"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        isAgency: json["isAgency"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "name": name,
        "type": typeValues.reverse[type],
        "isAgency": isAgency,
      };
}

enum Type { AUTHOR }

final typeValues = EnumValues({"author": Type.AUTHOR});

enum DataType { NEWS }

final dataTypeValues = EnumValues({"news": DataType.NEWS});

enum Lang { ENG, IND }

final langValues = EnumValues({"eng": Lang.ENG, "ind": Lang.IND});

class Source {
  String? uri;
  DataType? dataType;
  String? title;

  Source({
    this.uri,
    this.dataType,
    this.title,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        uri: json["uri"],
        dataType: dataTypeValues.map[json["dataType"]]!,
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "dataType": dataTypeValues.reverse[dataType],
        "title": title,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
