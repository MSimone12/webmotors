import 'package:dartz/dartz.dart';
import 'package:webmotors/src/core/errors/app_error.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';
import 'package:webmotors/src/domain/repository/vehicles_repository.dart';

abstract class GetVehiclesUseCase {
  Future<Either<AppError, List<VehicleModel>>> call([int page = 1]);
}

class GetVehicles implements GetVehiclesUseCase {
  final VehiclesRepository repository;

  GetVehicles(this.repository);

  @override
  Future<Either<AppError, List<VehicleModel>>> call([int page = 1]) async {
    try {
      final vehicles = await repository.getVehicles(page);
      if (vehicles != null) {
        return Right(vehicles);
      }
      return Left(AppError('Veiculos não encontrados'));
    } on AppError catch (e) {
      return Left(e);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return Left(AppError());
    }
  }
}
