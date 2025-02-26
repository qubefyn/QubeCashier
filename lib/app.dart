import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:qube_cashier/core/Network/connection_cubit.dart';
import 'package:qube_cashier/core/helper%20function/on_generate_function.dart';
import 'package:qube_cashier/core/widgets/disconnected_screen.dart';
import 'package:qube_cashier/injection_container.dart' as di;

import 'Features/MainLayout/presentaition/view/main_layout.dart';
import 'config/locale/app_localizations_setup.dart';

class QubeCashier extends StatefulWidget {
  const QubeCashier({super.key});

  @override
  State<QubeCashier> createState() => _QubeCashierState();
}

class _QubeCashierState extends State<QubeCashier> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnectionCubit>(
            create: (context) => di.sl<ConnectionCubit>(),
          ),
        ],
        child: BlocBuilder<ConnectionCubit, ConnectionStatus>(
          builder: (context, state) {
            if (state == ConnectionStatus.disconnected) {
              return const MaterialApp(
                home: DisconnectedScreen(),
                debugShowCheckedModeBanner: false,
              );
            } else {
              return MaterialApp(
                navigatorKey: navigatorKey,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                locale: Locale('en'),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: onGenerateRoute,
                initialRoute: MainLayout.routeName,
              );
            }
          },
        ),
      ),
    );
  }
}
