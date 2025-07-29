import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NutritionInfoItem extends StatelessWidget {
  final String title;
  final double value;

  const NutritionInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) &&
        ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.labelSmall!.copyWith(
            fontSize: isMobile
                ? 10.0
                : smallerThanDesktop
                ? 14.0
                : 18.0,
          ),
        ),
        Text(
          '$value kcal',
          style: textTheme.labelMedium!.copyWith(
            fontSize: isMobile
                ? 10.0
                : smallerThanDesktop
                ? 14.0
                : 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
