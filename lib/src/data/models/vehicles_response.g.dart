// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleResponse _$VehicleResponseFromJson(Map<String, dynamic> json) =>
    VehicleResponse(
      id: json['ID'] as int,
      make: json['Make'] as String,
      model: json['Model'] as String,
      version: json['Version'] as String,
      image: json['Image'] as String,
      km: json['KM'] as int,
      price: json['Price'] as String,
      yearModel: json['YearModel'] as int,
      yearFab: json['YearFab'] as int,
      color: json['Color'] as String,
    );
