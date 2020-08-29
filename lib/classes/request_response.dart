// To parse this JSON data, do
//
//     final requestResponse = requestResponseFromJson(jsonString);

import 'dart:convert';

import 'package:paquetes/classes/person.dart';

RequestResponse requestResponseFromJson(String str) =>
    RequestResponse.fromJson(json.decode(str));

String requestResponseToJson(RequestResponse data) =>
    json.encode(data.toJson());

class RequestResponse {
  RequestResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.ad,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Person> data;
  Ad ad;

  factory RequestResponse.fromJson(Map<String, dynamic> json) =>
      RequestResponse(
        page: json['page'],
        perPage: json['per_page'],
        total: json['total'],
        totalPages: json['total_pages'],
        data: List<Person>.from(json['data'].map((x) => Person.fromJson(x))),
        ad: Ad.fromJson(json['ad']),
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'ad': ad.toJson(),
      };
}

class Ad {
  Ad({
    this.company,
    this.url,
    this.text,
  });

  String company;
  String url;
  String text;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        company: json['company'],
        url: json['url'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        'company': company,
        'url': url,
        'text': text,
      };
}
