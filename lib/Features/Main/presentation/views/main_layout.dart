import 'package:flutter/material.dart';
import 'package:qube_cashier/Features/Mobile/presentation/view/mobile_ui_layout.dart';
import 'package:qube_cashier/Features/Tablet/presentation/view/tablet_ui_layout.dart';
import 'package:qube_cashier/core/widgets/adaptive_ui.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});
  static const String routeName = "main_layout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),
      body: AdaptiveUi(
        mobileLayout: (context) => const MobileUiLayout(),
        tabletLayout: (context) => const TabletUiLayout(),
      ),
    );
  }
}
