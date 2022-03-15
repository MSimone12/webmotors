import 'package:webmotors/src/domain/entities/vehicle_model.dart';

abstract class RemoteDataSource {
  Future<List<VehicleModel>?> getVehicles([int page = 1]);
}
