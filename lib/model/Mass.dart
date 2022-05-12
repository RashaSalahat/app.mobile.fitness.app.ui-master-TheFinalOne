// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.name,
    required this.height,
    required this.mass,
  });

  String id;
  String name;
  String height;
  String mass;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["_id"],
        name: json["name"],
        height: json["Height"],
        mass: json["Mass"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "Height": height,
        "Mass": mass,
      };
}
