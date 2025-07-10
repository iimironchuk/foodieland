import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_row/separated_row.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Widget _buildMainContent(
    TextTheme textTheme,
    bool smallerThanDesktop,
    bool smallerThanLaptop,
  ) {
    final List<Widget> children = [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Foodieland', style: textTheme.titleMedium),
                TextSpan(
                  text: '.',
                  style: textTheme.titleMedium!.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Lorem ipsum dolor sit amet, consectetuipisicing elit,',
            style: textTheme.labelSmall,
          ),
        ],
      ),
      SizedBox(height: smallerThanDesktop ? 25.0 : 0),
      SeparatedRow(
        separatorBuilder: (context, index) => SizedBox(width: smallerThanLaptop
            ? 5.0
            : smallerThanDesktop
            ? 30.0
            : 60.0,),
        children: [
          TextButton(onPressed: () {}, child: Text('Recipes')),
          TextButton(onPressed: () {}, child: Text('Blog')),
          TextButton(onPressed: () {}, child: Text('Contact')),
          TextButton(onPressed: () {}, child: Text('About us')),
        ],
      ),
    ];
    return smallerThanLaptop
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Column(
          children: [
            _buildMainContent(textTheme, smallerThanDesktop, smallerThanLaptop),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Divider(color: AppColors.dividerColor),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '© 2020 Flowbase. Powered by ',
                    style: textTheme.labelSmall,
                  ),
                  TextSpan(
                    text: 'Webflow',
                    style: textTheme.labelSmall!.copyWith(
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}
