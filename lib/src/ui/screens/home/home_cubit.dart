import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';
import 'package:webmotors/src/domain/usecases/get_vehicles_use_case.dart';

part 'home_cubit.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<VehicleModel> vehicles,
    @Default(1) int page,
    @Default(false) bool loadedAll,
    @Default(false) bool loading,
    @Default(false) bool error,
    String? errorMsg,
  }) = _HomeState;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getVehicles) : super(const HomeState());

  final GetVehiclesUseCase _getVehicles;

  void resetErrorState() => emit(
        state.copyWith(
          error: false,
          errorMsg: null,
        ),
      );

  Future<void> getVehicles() async {
    if (state.loadedAll) return;
    emit(state.copyWith(loading: true));
    final foldable = await _getVehicles(state.page);

    foldable.fold(
      (l) => emit(
        state.copyWith(
          error: true,
          errorMsg: l.toString(),
        ),
      ),
      (r) {
        final loadedAll = r.isEmpty;
        emit(
          state.copyWith(
            page: state.page + (loadedAll ? 0 : 1),
            loadedAll: loadedAll,
            vehicles: loadedAll
                ? state.vehicles
                : [
                    ...state.vehicles,
                    ...r,
                  ],
          ),
        );
      },
    );
    emit(state.copyWith(loading: false));
  }
}
