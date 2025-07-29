import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/utils/extensions.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/category_model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final VoidCallback onCategoryTap;
  final CategoryModel category;

  const CategoryItem({super.key, required this.category, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    return GestureDetector(
      onTap: onCategoryTap,
      child: SizedBox(
        height: smallerThanLaptop
            ? 150.0
            : smallerThanDesktop
            ? 200.0
            : 250.0,
        width: smallerThanLaptop
            ? 80.0
            : smallerThanDesktop
            ? 130.0
            : 180,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: smallerThanLaptop
                  ? 80.0
                  : smallerThanDesktop
                  ? 130.0
                  : 180,
              height: smallerThanLaptop
                  ? 50.0
                  : smallerThanDesktop
                  ? 100.0
                  : 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.scaffold,
                    category.backgroundColor.toColor().withValues(alpha: 0),
                    category.backgroundColor.toColor().withValues(alpha: 0.1),
                  ],
                  stops: [0.0, 0.0, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular( smallerThanLaptop ? 10 : smallerThanDesktop ? 20 :30),
              ),
            ),
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CachedNetworkImage(
                    imageUrl: category.categoryImage,
                    width: smallerThanLaptop
                        ? 60.0
                        : smallerThanDesktop
                        ? 80.0
                        : 100.0,
                    height: smallerThanLaptop
                        ? 60.0
                        : smallerThanDesktop
                        ? 80.0
                        : 100.0,
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    category.title,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: smallerThanLaptop
                          ? 12.0
                          : smallerThanDesktop
                          ? 15.0
                          : 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
