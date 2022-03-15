import 'package:flutter/material.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';
import 'package:webmotors/src/ui/routes/route_names.dart';
import 'package:webmotors/src/ui/screens/details/details_screen.dart';
import 'package:webmotors/src/ui/screens/home/home_screen.dart';
import 'package:webmotors/src/ui/screens/splash/splash_screen.dart';

class AppRoutes {
  static Map<String, MaterialPageRoute> pages(RouteSettings settings) => {
        RouteNames.splash: MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        ),
        RouteNames.home: MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        ),
        RouteNames.details: MaterialPageRoute(
          builder: (context) => DetailsScreen(
            vehicle: settings.arguments as VehicleModel,
          ),
          settings: settings,
          fullscreenDialog: false,
        ),
      };
}
