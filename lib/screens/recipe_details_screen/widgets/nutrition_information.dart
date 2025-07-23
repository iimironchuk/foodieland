import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_column/separated_column.dart';

import '../../../resources/app_colors.dart';
import 'nutrition_info_item.dart';

class NutritionInformation extends StatelessWidget {
  final double calories;
  final double totalFat;
  final double protein;
  final double carbohydrate;
  final double cholesterol;

  const NutritionInformation({
    super.key,
    required this.calories,
    required this.totalFat,
    required this.protein,
    required this.carbohydrate,
    required this.cholesterol,
  });

  @override
  Widget build(BuildContext context) {
    final smallerThanDesktop =
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) &&
        ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final isSmallLaptop =
        MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width > 800;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: 400 / 600,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.lightBlue,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            isMobile
                ? 16.0
                : isTablet
                ? 32.0
                : smallerThanDesktop
                ? 24.0
                : 32.0,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nutrition information',
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: isMobile
                        ? 16.0
                        : isSmallLaptop
                        ? 18.0
                        : 24.0,
                  ),
                ),
              ),
              SizedBox(
                height: isMobile || isSmallLaptop
                    ? 16.0
                    : smallerThanDesktop
                    ? 20.0
                    : 24.0,
              ),
              SeparatedColumn(
                children: [
                  NutritionInfoItem(title: 'Calories', value: calories),
                  NutritionInfoItem(title: 'Total Fat', value: totalFat),
                  NutritionInfoItem(title: 'Protein', value: protein),
                  NutritionInfoItem(title: 'Carbohydrate', value: carbohydrate),
                  NutritionInfoItem(title: 'Cholesterol', value: cholesterol),
                ],
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isSmallLaptop || isMobile
                        ? 8.0
                        : smallerThanDesktop
                        ? 12.0
                        : 16.0,
                  ),
                  child: Divider(color: AppColors.veryLightGrey),
                ),
              ),
              Spacer(),
              Text(
                'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                style: textTheme.labelSmall!.copyWith(
                  fontSize: isMobile
                      ? 8.0
                      : smallerThanDesktop
                      ? 12.0
                      : 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
