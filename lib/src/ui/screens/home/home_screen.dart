import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webmotors/src/core/assets.dart';
import 'package:webmotors/src/core/widgets/vehicle_card.dart';
import 'package:webmotors/src/di/injection_module.dart';
import 'package:webmotors/src/ui/screens/home/home_cubit.dart';
import 'package:webmotors/src/ui/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeCubit _cubit = AppInjector.I.get();
  final _scrollController = ScrollController();
  Timer? _scrollDebouncer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _cubit.getVehicles();
    });
    initScroll();
  }

  void initScroll() {
    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      final maxExtent = _scrollController.position.maxScrollExtent;
      if (offset >= maxExtent) {
        if (_scrollDebouncer?.isActive ?? false) {
          _scrollDebouncer?.cancel();
        }
        _scrollDebouncer = Timer(
          const Duration(milliseconds: 200),
          () => _cubit.getVehicles(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SvgPicture.asset(AppAssets.logo),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {
          if (!state.loading && state.vehicles.isEmpty) {
            return const Center(
              child: Text('Não foram achados veículos'),
            );
          }
          return Stack(
            children: [
              Positioned.fill(
                child: ListView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...state.vehicles
                        .map((e) => VehicleCard(vehicle: e))
                        .toList(),
                    if (state.loadedAll) ...[
                      SizedBox(
                        height: 64,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Por hoje é só ;)',
                            style: hint.copyWith(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
              if (state.loading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(.45),
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        child: CircularProgressIndicator(
                          color: AppTheme.primary.primary,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
