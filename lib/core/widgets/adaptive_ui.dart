import 'package:flutter/material.dart';
import 'package:qube_cashier/core/utils/size_config.dart';

class AdaptiveUi extends StatelessWidget {
  const AdaptiveUi({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
  });
  final WidgetBuilder mobileLayout, tabletLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < SizeConfig.tablet) {
        return mobileLayout(context);
      } else {
        return tabletLayout(context);
      }
    });
  }
}
