import 'package:webmotors/src/data/models/vehicles_response.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';

class VehiclesMapper {
  static List<VehicleModel> mapFromResponse(List<VehicleResponse> response) =>
      response
          .map(
            (vehicle) => VehicleModel(
              id: vehicle.id,
              make: vehicle.make,
              model: vehicle.model,
              version: vehicle.version,
              image: vehicle.image,
              km: vehicle.km,
              price: vehicle.price,
              yearModel: vehicle.yearModel,
              yearFab: vehicle.yearFab,
              color: vehicle.color,
            ),
          )
          .toList();
}
