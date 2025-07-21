import 'package:flutter/material.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: 400/600,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.lightBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nutrition information',
                  style: textTheme.labelMedium!.copyWith(fontSize: 24.0),
                ),
              ),
              SizedBox(height: 24.0),
              SeparatedColumn(
                children: [
                  NutritionInfoItem(title: 'Calories', value: calories),
                  NutritionInfoItem(title: 'Total Fat', value: totalFat),
                  NutritionInfoItem(title: 'Protein', value: protein),
                  NutritionInfoItem(title: 'Carbohydrate', value: carbohydrate),
                  NutritionInfoItem(title: 'Cholesterol', value: cholesterol),
                ],
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(color: AppColors.veryLightGrey),
                ),
              ),
              Spacer(),
              Text(
                'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
