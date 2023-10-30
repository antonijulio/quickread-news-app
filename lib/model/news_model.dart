// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

/**
 * ?? API DATA FROM 
 * ?? ===[ NEWSDATA.IO ]====
 */

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel {
  String? status;
  int? totalResults;
  List<Result>? results;
  String? nextPage;

  NewsModel({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );
}

class Result {
  String? articleId;
  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  dynamic videoUrl;
  String? description;
  String? content;
  DateTime? pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  List<String>? country;
  List<String>? category;
  String? language;

  Result({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.country,
    this.category,
    this.language,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        articleId: json["article_id"],
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"],
        pubDate:
            json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        sourcePriority: json["source_priority"],
        country: json["country"] == null
            ? []
            : List<String>.from(json["country"]!.map((x) => x)),
        category: json["category"] == null
            ? []
            : List<String>.from(json["category"]!.map((x) => x)),
        language: json["language"],
      );
}
