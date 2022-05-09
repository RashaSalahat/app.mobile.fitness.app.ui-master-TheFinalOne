// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
//workout_api

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome(
      {required this.id,
      required this.userid,
      required this.name,
      required this.mon,
      required this.tue,
      required this.wed,
      required this.thur,
      required this.fri,
      required this.sat,
      required this.sun});

  String id;
  String userid;
  String name;
  int mon;
  int tue;
  int wed;
  int thur;
  int fri;
  int sat;
  int sun;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
      id: json["_id"],
      userid: json["userid"],
      name: json["name"],
      mon: json["Mon"],
      tue: json["Tue"],
      wed: json["Wed"],
      thur: json["Thur"],
      fri: json["Fri"],
      sat: json["Sat"],
      sun: json["Sun"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userid": userid,
        "name": name,
        "Mon": mon,
        "Tue": tue,
        "Wed": wed,
        "Thur": thur,
        "Fri": fri,
        "Sat": sat,
        "Sun": sun
      };
}
