import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    super.key,
    required this.width,
    required this.image,
  });

  final double width;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(),
      ),
      child: Center(
          child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 30, maxHeight: 30),
        child: SvgPicture.asset(
          image,
          width: width * .02,
        ),
      )),
    );
  }
}
