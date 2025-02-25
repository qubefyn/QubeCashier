import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:qube_cashier/Features/Main/presentation/views/main_layout.dart';
import 'package:qube_cashier/core/Network/connection_cubit.dart';
import 'package:qube_cashier/core/helper%20function/on_generate_function.dart';
import 'package:qube_cashier/core/widgets/disconnected_screen.dart';
import 'package:qube_cashier/injection_container.dart' as di;

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
                supportedLocales: const [
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  /*   S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate, */
                ],
                locale: const Locale('ar'),
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
