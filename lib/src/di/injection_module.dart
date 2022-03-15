import 'dart:async';

import 'package:get_it/get_it.dart';

class AppInjector {
  AppInjector._();

  static GetIt I = GetIt.I;
}

abstract class InjectionModule {
  FutureOr<void> inject(GetIt injector);
}
