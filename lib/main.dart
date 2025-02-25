import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qube_cashier/app.dart';
import 'package:qube_cashier/bloc_observer.dart';
import 'package:qube_cashier/core/prefs/my_shared_prefs.dart';
import 'package:qube_cashier/core/utils/config_loading.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharePre();

  await di.init();
  //Stripe.publishableKey=EndPoints.publishableKey;
  Bloc.observer = AppBlocObserver();
  ConfigLoading.configLoading();
  runApp(const QubeCashier());
}
