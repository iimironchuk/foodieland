import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';

class InfoWithIconContainer extends StatelessWidget {
  final String icon;
  final String info;

  const InfoWithIconContainer({
    super.key,
    required this.icon,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    return Container(
      decoration: BoxDecoration(
        color: AppColors.veryLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: smallerThanLaptop ? 4.0 : 8.0, horizontal: smallerThanLaptop ? 8.0 : 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: smallerThanLaptop ? 15.0 : 24.0,
              height: smallerThanLaptop ? 15.0 : 24.0,
            ),
            SizedBox(width: smallerThanLaptop ? 5.0 : 10.0),
            Text(
              info,
              style: textTheme.labelSmall!.copyWith(
                fontSize: smallerThanLaptop ? 12.0 : 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
