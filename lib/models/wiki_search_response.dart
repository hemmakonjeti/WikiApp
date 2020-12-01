// To parse this JSON data, do
//
//     final wikiSearchResponse = wikiSearchResponseFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'wiki_search_response.g.dart';

WikiSearchResponse wikiSearchResponseFromJson(String str) =>
    WikiSearchResponse.fromJson(json.decode(str));

String wikiSearchResponseToJson(WikiSearchResponse data) =>
    json.encode(data.toJson());

@HiveType(typeId: 0)
class WikiSearchResponse {
  WikiSearchResponse({
    this.batchcomplete,
    this.wikiSearchResponseContinue,
    this.query,
  });
  @HiveField(0)
  bool batchcomplete;
  @HiveField(1)
  Continue wikiSearchResponseContinue;
  @HiveField(2)
  Query query;

  factory WikiSearchResponse.fromJson(Map<String, dynamic> json) =>
      WikiSearchResponse(
        batchcomplete: json["batchcomplete"],
        wikiSearchResponseContinue: Continue.fromJson(json["continue"]),
        query: Query.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "batchcomplete": batchcomplete,
        "continue": wikiSearchResponseContinue.toJson(),
        "query": query.toJson(),
      };
}

@HiveType(typeId: 1)
class Query {
  Query({
    this.redirects,
    this.pages,
  });
  @HiveField(0)
  List<Redirect> redirects;
  @HiveField(1)
  List<ResultPage> pages;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        redirects: List<Redirect>.from(
            json["redirects"].map((x) => Redirect.fromJson(x))),
        pages: List<ResultPage>.from(
            json["pages"].map((x) => ResultPage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "redirects": List<dynamic>.from(redirects.map((x) => x.toJson())),
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class ResultPage {
  ResultPage({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.thumbnail,
    this.terms,
  });
  @HiveField(0)
  int pageid;
  @HiveField(1)
  int ns;
  @HiveField(2)
  String title;
  @HiveField(3)
  int index;
  @HiveField(4)
  Thumbnail thumbnail;
  @HiveField(5)
  Terms terms;

  factory ResultPage.fromJson(Map<String, dynamic> json) => ResultPage(
        pageid: json["pageid"],
        ns: json["ns"],
        title: json["title"],
        index: json["index"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
      );

  Map<String, dynamic> toJson() => {
        "pageid": pageid,
        "ns": ns,
        "title": title,
        "index": index,
        "thumbnail": thumbnail == null ? null : thumbnail.toJson(),
        "terms": terms == null ? null : terms.toJson(),
      };
}

@HiveType(typeId: 3)
class Terms {
  Terms({
    this.description,
  });
  @HiveField(0)
  List<String> description;

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        description: List<String>.from(json["description"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": List<dynamic>.from(description.map((x) => x)),
      };
}

@HiveType(typeId: 4)
class Thumbnail {
  Thumbnail({
    this.source,
    this.width,
    this.height,
  });
  @HiveField(0)
  String source;
  @HiveField(1)
  int width;
  @HiveField(2)
  int height;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        source: json["source"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "width": width,
        "height": height,
      };
}

@HiveType(typeId: 5)
class Redirect {
  Redirect({
    this.index,
    this.from,
    this.to,
  });
  @HiveField(0)
  int index;
  @HiveField(1)
  String from;
  @HiveField(2)
  String to;

  factory Redirect.fromJson(Map<String, dynamic> json) => Redirect(
        index: json["index"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "from": from,
        "to": to,
      };
}

@HiveType(typeId: 6)
class Continue {
  Continue({
    this.gpsoffset,
    this.continueContinue,
  });
  @HiveField(0)
  int gpsoffset;
  @HiveField(1)
  String continueContinue;

  factory Continue.fromJson(Map<String, dynamic> json) => Continue(
        gpsoffset: json["gpsoffset"],
        continueContinue: json["continue"],
      );

  Map<String, dynamic> toJson() => {
        "gpsoffset": gpsoffset,
        "continue": continueContinue,
      };
}
