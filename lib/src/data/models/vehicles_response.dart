import 'package:json_annotation/json_annotation.dart';

part 'vehicles_response.g.dart';

@JsonSerializable(createToJson: false)
class VehicleResponse {
  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'Make')
  final String make;
  @JsonKey(name: 'Model')
  final String model;
  @JsonKey(name: 'Version')
  final String version;
  @JsonKey(name: 'Image')
  final String image;
  @JsonKey(name: 'KM')
  final int km;
  @JsonKey(name: 'Price')
  final String price;
  @JsonKey(name: 'YearModel')
  final int yearModel;
  @JsonKey(name: 'YearFab')
  final int yearFab;
  @JsonKey(name: 'Color')
  final String color;

  const VehicleResponse({
    required this.id,
    required this.make,
    required this.model,
    required this.version,
    required this.image,
    required this.km,
    required this.price,
    required this.yearModel,
    required this.yearFab,
    required this.color,
  });

  factory VehicleResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleResponseFromJson(json);
}
