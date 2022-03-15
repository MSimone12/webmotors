import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webmotors/src/core/assets.dart';
import 'package:webmotors/src/core/util.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';
import 'package:webmotors/src/ui/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  final VehicleModel vehicle;
  const DetailsScreen({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  int get price => int.parse(vehicle.price.replaceAll(RegExp(r'\D'), ''));

  String get km => vehicle.km < 1000
      ? vehicle.km.toString()
      : (vehicle.km / (1000)).toStringAsFixed(3).replaceAll(',', '.');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppTheme.primary.primary,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height / 3) + 32,
                child: Stack(
                  children: [
                    Hero(
                      tag: vehicle.id,
                      child: Image.network(
                        vehicle.image.replaceFirst('http', 'https'),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        height: 64,
                        width: MediaQuery.of(context).size.width * .6,
                        child: CustomPaint(
                          painter: PriceTag(),
                          child: Container(
                            margin: const EdgeInsets.all(16),
                            child: Text(
                              'R\$ ${maskBalance(price)}',
                              style: title.copyWith(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: Text(
                  '${vehicle.make} ${vehicle.model}',
                  style: title,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  vehicle.version,
                  style: subtitle,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Ano: ${vehicle.yearFab}',
                              style: hint,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Modelo: ${vehicle.yearModel}',
                              style: hint,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.speed_sharp,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$km Km',
                              style: hint,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.colorize_rounded,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              vehicle.color,
                              style: hint,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 72,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primary.primary,
                      AppTheme.primary.primary.withOpacity(.7),
                    ],
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.logo,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PriceTag extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width * .85, size.height)
      ..lineTo(0, size.height)
      ..close;

    final paint = Paint()
      ..color = AppTheme.primary.primary
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
