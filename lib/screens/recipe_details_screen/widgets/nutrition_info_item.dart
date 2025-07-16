import 'package:flutter/material.dart';

class NutritionInfoItem extends StatelessWidget {
  final String title;
  final double value;
  const NutritionInfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.labelSmall!.copyWith(fontSize: 18.0),
        ),
        Text(
          '$value kcal',
          style: textTheme.labelMedium!.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
