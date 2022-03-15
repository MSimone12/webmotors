// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {List<VehicleModel> vehicles = const [],
      int page = 1,
      bool loadedAll = false,
      bool loading = false,
      bool error = false,
      String? errorMsg}) {
    return _HomeState(
      vehicles: vehicles,
      page: page,
      loadedAll: loadedAll,
      loading: loading,
      error: error,
      errorMsg: errorMsg,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  List<VehicleModel> get vehicles => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get loadedAll => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {List<VehicleModel> vehicles,
      int page,
      bool loadedAll,
      bool loading,
      bool error,
      String? errorMsg});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? vehicles = freezed,
    Object? page = freezed,
    Object? loadedAll = freezed,
    Object? loading = freezed,
    Object? error = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      vehicles: vehicles == freezed
          ? _value.vehicles
          : vehicles // ignore: cast_nullable_to_non_nullable
              as List<VehicleModel>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      loadedAll: loadedAll == freezed
          ? _value.loadedAll
          : loadedAll // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<VehicleModel> vehicles,
      int page,
      bool loadedAll,
      bool loading,
      bool error,
      String? errorMsg});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? vehicles = freezed,
    Object? page = freezed,
    Object? loadedAll = freezed,
    Object? loading = freezed,
    Object? error = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_HomeState(
      vehicles: vehicles == freezed
          ? _value.vehicles
          : vehicles // ignore: cast_nullable_to_non_nullable
              as List<VehicleModel>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      loadedAll: loadedAll == freezed
          ? _value.loadedAll
          : loadedAll // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.vehicles = const [],
      this.page = 1,
      this.loadedAll = false,
      this.loading = false,
      this.error = false,
      this.errorMsg});

  @JsonKey()
  @override
  final List<VehicleModel> vehicles;
  @JsonKey()
  @override
  final int page;
  @JsonKey()
  @override
  final bool loadedAll;
  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final bool error;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'HomeState(vehicles: $vehicles, page: $page, loadedAll: $loadedAll, loading: $loading, error: $error, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other.vehicles, vehicles) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.loadedAll, loadedAll) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(vehicles),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(loadedAll),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {List<VehicleModel> vehicles,
      int page,
      bool loadedAll,
      bool loading,
      bool error,
      String? errorMsg}) = _$_HomeState;

  @override
  List<VehicleModel> get vehicles;
  @override
  int get page;
  @override
  bool get loadedAll;
  @override
  bool get loading;
  @override
  bool get error;
  @override
  String? get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
