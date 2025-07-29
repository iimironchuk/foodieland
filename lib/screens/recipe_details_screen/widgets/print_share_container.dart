import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PrintShareContainer extends StatelessWidget {
  final String asset;
  final String title;
  final VoidCallback onTap;

  const PrintShareContainer({
    super.key,
    required this.asset,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: smallerThanDesktop ? 60.0 : 80.0,
            height: smallerThanDesktop ? 60.0 : 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightBlue,
            ),
            child: SvgPicture.asset(asset, fit: BoxFit.scaleDown),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          title,
          style: textTheme.labelMedium!.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
