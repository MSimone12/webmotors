import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webmotors/src/core/util.dart';
import 'package:webmotors/src/di/app_injection_module.dart';
import 'package:webmotors/src/di/injection_module.dart';
import 'package:webmotors/src/ui/routes/route_names.dart';
import 'package:webmotors/src/ui/routes/routes.dart';
import 'package:webmotors/src/ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInjectionModule().inject(AppInjector.I);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webmotors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: fromHex('#F3F5F8'),
        colorScheme: AppTheme.primary,
        buttonTheme: ButtonThemeData(
          height: 48,
          buttonColor: fromHex('#F51344'),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: RouteNames.splash,
      onGenerateRoute: (settings) {
        return AppRoutes.pages(settings)[settings.name];
      },
    );
  }
}
