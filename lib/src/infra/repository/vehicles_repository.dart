import 'package:webmotors/src/data/datasource/remote_data_source.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';
import 'package:webmotors/src/domain/repository/vehicles_repository.dart';

class AppVehiclesRepository implements VehiclesRepository {
  final RemoteDataSource dataSource;

  AppVehiclesRepository(this.dataSource);

  @override
  Future<List<VehicleModel>?> getVehicles([int page = 1]) =>
      dataSource.getVehicles(page);
}
