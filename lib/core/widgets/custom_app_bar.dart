import 'package:flutter/material.dart';
import 'package:qube_cashier/core/utils/app_colors.dart';
import 'package:qube_cashier/core/utils/app_images.dart';
import 'package:qube_cashier/core/utils/text_styles.dart';
import 'package:qube_cashier/core/widgets/app_bar_icons.dart';
import 'package:qube_cashier/core/widgets/new_order_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: AppColors.secondaryColor),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: Row(
            children: [
              SizedBox(
                width: width * .05,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 120),
                child: Image.asset(
                  Assets.imagesAppLogo,
                  width: width * .15,
                ),
              ),
              SizedBox(width: width * .04),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  'Beit El Mashawy',
                  style: Styles.styleRegular16(context),
                ),
              ),
              SizedBox(width: width * .1),
              NewOrderButton(),
              SizedBox(width: width * .02),
              Row(
                children: [
                  AppBarIcons(
                    width: width,
                    image: Assets.imagesChatQuestion,
                  ),
                  SizedBox(width: 16),
                  AppBarIcons(
                    width: width,
                    image: Assets.imagesNotification,
                  ),
                  SizedBox(width: 16),
                  AppBarIcons(
                    width: width,
                    image: Assets.imagesCustomerSupport,
                  ),
                  SizedBox(width: 16),
                  AppBarIcons(
                    width: width,
                    image: Assets.imagesSetting,
                  ),
                ],
              ),
              SizedBox(width: width * .02),
              Row(
                children: [
                  Image.asset(
                    Assets.imagesAvatar,
                    width: width * .032,
                  ),
                  SizedBox(width: 8),
                  Text('Ahmed Korwash', style: Styles.styleBold16(context))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
