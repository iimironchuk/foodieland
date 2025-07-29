import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/print_share_container.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_row/separated_row.dart';

class OverviewDetailsRow extends StatelessWidget {
  final String authorImageUrl;
  final DateTime date;
  final String authorName;
  final int prepTime;
  final int cookTime;
  final String category;
  final VoidCallback onShare;
  final VoidCallback onPrint;

  const OverviewDetailsRow({
    super.key,
    required this.authorImageUrl,
    required this.date,
    required this.authorName,
    required this.prepTime,
    required this.cookTime,
    required this.category,
    required this.onShare,
    required this.onPrint,
  });

  Widget _buildTimeRow(String timeType, TextTheme textTheme, int time) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(Assets.icons.duration),
        SizedBox(width: 16.0),
        Column(
          mainAxisSize: MainAxisSize.min,
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

  Widget _buildDivider(bool smallerThanDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: smallerThanDesktop ? 16.0 : 32.0,
      ),
      child: SizedBox(
        height: 55.0,
        child: VerticalDivider(color: AppColors.veryLightGrey),
      ),
    );
  }

  Widget _buildContentByWidth(
    TextTheme textTheme,
    bool smallerThanDesktop,
    bool smallerThanLaptop,
  ) {
    final children = [
      Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          runSpacing: 12.0,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: authorImageUrl,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                SizedBox(width: smallerThanDesktop ? 12.0 : 16.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
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
            _buildDivider(smallerThanDesktop),
            _buildTimeRow('PREP TIME', textTheme, prepTime),
            _buildDivider(smallerThanDesktop),
            _buildTimeRow('COOK TIME', textTheme, cookTime),
            _buildDivider(smallerThanDesktop),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.recipeCategory),
                SizedBox(width: 16.0),
                Text(category, style: textTheme.labelSmall),
              ],
            ),
          ],
        ),
      ),

      smallerThanLaptop ? SizedBox(height: 20.0) : Spacer(),
      Row(
        children: [
          PrintShareContainer(
            asset: Assets.icons.print,
            title: 'PRINT',
            onTap: onPrint,
          ),
          SizedBox(width: smallerThanDesktop ? 16.0 : 32.0),
          PrintShareContainer(
            asset: Assets.icons.share,
            title: 'SHARE',
            onTap: onShare,
          ),
        ],
      ),
    ];

    return smallerThanLaptop
        ? Column(children: children)
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return SizedBox(
      height: smallerThanLaptop ? null : 115.0,
      width: double.infinity,
      child: _buildContentByWidth(
        textTheme,
        smallerThanDesktop,
        smallerThanLaptop,
      ),
    );
  }
}
