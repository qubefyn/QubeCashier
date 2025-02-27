import 'package:flutter/material.dart';
import 'package:qube_cashier/core/utils/text_styles.dart';

class NewOrderButton extends StatelessWidget {
  const NewOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 8),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.75, -0.66),
            end: Alignment(-0.75, 0.66),
            colors: [Color(0xFF000080), Color(0xFF0D05D2), Color(0xFF000080)],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          '+ New Order',
          style: Styles.styleRegular16(context).copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
