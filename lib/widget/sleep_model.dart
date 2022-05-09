// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcom> welcomFromJson(String str) =>
    List<Welcom>.from(json.decode(str).map((x) => Welcom.fromJson(x)));

String welcomToJson(List<Welcom> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcom {
  Welcom({
    required this.id,
    required this.name,
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thur,
    required this.fri,
    required this.sat,
    required this.sun,
  });

  String id;
  String name;
  int mon;
  int tue;
  int wed;
  int thur;
  int fri;
  int sat;
  int sun;

  factory Welcom.fromJson(Map<String, dynamic> json) => Welcom(
        id: json["_id"],
        name: json["name"],
        mon: json["Mon"],
        tue: json["Tue"],
        wed: json["Wed"],
        thur: json["Thur"],
        fri: json["Fri"],
        sat: json["Sat"],
        sun: json["Sun"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "Mon": mon,
        "Tue": tue,
        "Wed": wed,
        "Thur": thur,
        "Fri": fri,
        "Sat": sat,
        "Sun": sun,
      };
}
