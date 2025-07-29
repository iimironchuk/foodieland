import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_column/separated_column.dart';
import 'package:separated_row/separated_row.dart';

class ShareColumn extends StatelessWidget {
  const ShareColumn({super.key});

  Widget _buildShareRow(bool smallerThanDesktop) {
    final children = [
      SvgPicture.asset(Assets.icons.facebook),
      SvgPicture.asset(Assets.icons.twitter),
      SvgPicture.asset(Assets.icons.instagarm),
    ];

    return smallerThanDesktop
        ? SeparatedRow(
            children: children,
            separatorBuilder: (context, index) => SizedBox(width: 48.0),
          )
        : SeparatedColumn(
            children: children,
            separatorBuilder: (context, index) => SizedBox(height: 48.0),
          );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SHARE THIS ON',
          style: textTheme.labelMedium!.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: smallerThanDesktop ? 24.0 : 32.0),
        _buildShareRow(smallerThanDesktop),
      ],
    );
  }
}
