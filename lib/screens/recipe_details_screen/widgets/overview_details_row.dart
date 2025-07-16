import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:intl/intl.dart';

class OverviewDetailsRow extends StatelessWidget {
  final String authorImageUrl;
  final DateTime date;
  final String authorName;
  final int prepTime;
  final int cookTime;
  final String category;

  const OverviewDetailsRow({
    super.key,
    required this.authorImageUrl,
    required this.date,
    required this.authorName,
    required this.prepTime,
    required this.cookTime,
    required this.category,
  });

  Widget _buildTimeRow(String timeType, TextTheme textTheme, int time) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.duration),
        SizedBox(width: 16.0),
        Column(
          children: [
            Text(
              timeType,
              style: textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text('$time Minutes', style: textTheme.labelSmall),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 55.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: authorImageUrl,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    DateFormat('d MMMM yyyy').format(date),
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: VerticalDivider(color: AppColors.veryLightGrey),
          ),
          _buildTimeRow('PREP TIME', textTheme, prepTime),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: VerticalDivider(color: AppColors.veryLightGrey),
          ),
          _buildTimeRow('COOK TIME', textTheme, cookTime),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: VerticalDivider(color: AppColors.veryLightGrey),
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.icons.recipeCategory),
              SizedBox(width: 10.0),
              Text(category, style: textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
