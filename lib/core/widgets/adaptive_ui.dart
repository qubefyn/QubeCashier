import 'package:flutter/material.dart';
import 'package:qube_cashier/core/utils/size_config.dart';

import '../../config/locale/app_localizations.dart';

class AdaptiveUi extends StatelessWidget {
  const AdaptiveUi({
    super.key,
    required this.tabletLayout,
  });

  final WidgetBuilder tabletLayout;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    if (SizeConfig.isMobile) {

      return   Scaffold(
        body: Center(
          child: Text(AppLocalizations.of(context)!.translate("Mobile Layout: Please open on a tablet or web.")!),
        ),
      );
    } else {

      return tabletLayout(context);
    }
  }
}