import 'package:webmotors/src/core/http_client.dart';
import 'package:webmotors/src/data/datasource/remote_data_source.dart';
import 'package:webmotors/src/data/mappers/vehicles_mapper.dart';
import 'package:webmotors/src/data/models/vehicles_response.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';

class AppRemoteDataSource implements RemoteDataSource {
  final HttpService _httpClient;

  AppRemoteDataSource(this._httpClient);

  @override
  Future<List<VehicleModel>?> getVehicles([int page = 1]) =>
      _httpClient.request<List<VehicleModel>>(
        '/Vehicles',
        type: RequestType.get,
        queryParameters: {
          'Page': page,
        },
        listParser: (json) {
          final vehicles = json.map((e) => VehicleResponse.fromJson(e));
          return VehiclesMapper.mapFromResponse(vehicles.toList());
        },
      );
}
