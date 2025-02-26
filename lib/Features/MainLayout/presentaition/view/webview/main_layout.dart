import 'package:flutter/material.dart';

import 'package:qube_cashier/core/widgets/adaptive_ui.dart';

import '../tabletView/tablet_ui_layout.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});
  static const String routeName = "main_layout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),
      body: AdaptiveUi(

        tabletLayout: (context) => const TabletUiLayout(),
      ),
    );
  }
}
