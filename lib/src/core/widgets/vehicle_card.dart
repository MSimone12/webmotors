import 'package:flutter/material.dart';
import 'package:webmotors/src/core/util.dart';
import 'package:webmotors/src/domain/entities/vehicle_model.dart';
import 'package:webmotors/src/ui/routes/route_names.dart';
import 'package:webmotors/src/ui/theme/app_theme.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    Key? key,
    required this.vehicle,
  }) : super(key: key);
  final VehicleModel vehicle;

  int get price => int.parse(vehicle.price.replaceAll(RegExp(r'\D'), ''));

  String get km => vehicle.km < 1000
      ? vehicle.km.toString()
      : (vehicle.km / (1000)).toStringAsFixed(3).replaceAll(',', '.');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: MediaQuery.of(context).size.height * .5,
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          RouteNames.details,
          arguments: vehicle,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Hero(
                          tag: vehicle.id,
                          child: Image.network(
                            vehicle.image.replaceFirst('http', 'https'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              'R\$ ${maskBalance(price)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${vehicle.make} ${vehicle.model}',
                        style: title,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        vehicle.version,
                        style: subtitle,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${vehicle.yearFab}/${vehicle.yearModel}',
                                style: hint,
                              ),
                            ],
                          ),
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
                      )
                    ],
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
