import 'package:equatable/equatable.dart';

class VehicleModel extends Equatable {
  final int id;
  final String make;
  final String model;
  final String version;
  final String image;
  final int km;
  final String price;
  final int yearModel;
  final int yearFab;
  final String color;

  const VehicleModel({
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

  @override
  List<Object?> get props => [
        id,
        make,
        model,
        version,
        image,
        km,
        price,
        yearModel,
        yearFab,
        color,
      ];
}
