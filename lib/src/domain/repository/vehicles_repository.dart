import 'package:webmotors/src/domain/entities/vehicle_model.dart';

abstract class VehiclesRepository {
  Future<List<VehicleModel>?> getVehicles([int page = 1]);
}
