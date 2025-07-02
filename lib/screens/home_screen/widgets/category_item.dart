import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/utils/extensions.dart';

import '../../../models/category_model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 180.0,
            height: 150.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.scaffold,
                  category.backgroundColor.toColor().withValues(alpha:  0),
                  category.backgroundColor.toColor().withValues(alpha:  0.1),
                ],
                stops: [0.0, 0.0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(imageUrl: category.categoryImage),
                SizedBox(height: 50.0),
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
