import 'package:flutter/material.dart';
import 'package:qube_cashier/core/widgets/custom_app_bar.dart';

class TabletOverViewScreenBody extends StatelessWidget {
  const TabletOverViewScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [CustomAppBar(width: width)],
          ),
        ),
      ],
    );
  }
}
