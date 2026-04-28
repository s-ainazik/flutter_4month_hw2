import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CountryModel extends Equatable {
  CountryModel({
    required this.placeId,
    required this.lat,
    required this.lon,
    required this.name,
    required this.displayName,
  });

  final int placeId;
  final String lat;
  final String lon;
  final String name;
  final String displayName;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      placeId: json["place_id"],
      lat: json["lat"],
      lon: json["lon"],
      name: json["name"],
      displayName: json["display_name"],
    );
  }

  @override
  List<Object?> get props => [displayName, placeId, lat, lon, name];
}
