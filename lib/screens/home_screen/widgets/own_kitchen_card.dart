import 'package:flutter/material.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../resources/app_colors.dart';

class OwnKitchenCard extends StatelessWidget {
  final VoidCallback onLearnMore;

  const OwnKitchenCard({super.key, required this.onLearnMore});

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Everyone can be a chef in their own kitchen',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: smallerThanLaptop
                      ? 24.0
                      : smallerThanDesktop
                      ? 36.0
                      : 48.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: smallerThanLaptop
                    ? 12.0
                    : smallerThanDesktop
                    ? 18.0
                    : 24.0,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim',
                style: textTheme.labelSmall!.copyWith(
                  fontSize: smallerThanLaptop
                      ? 12.0
                      : smallerThanDesktop
                      ? 14.0
                      : 16.0,
                ),
              ),
              SizedBox(
                height: smallerThanLaptop
                    ? 24.0
                    : smallerThanDesktop
                    ? 48.0
                    : 72.0,
              ),
              SizedBox(
                height: smallerThanLaptop
                    ? 40.0
                    : smallerThanDesktop
                    ? 50.0
                    : 60.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        smallerThanLaptop
                            ? 10.0
                            : smallerThanDesktop
                            ? 13.0
                            : 16,
                      ),
                    ),
                  ),
                  onPressed: onLearnMore,
                  child: Text(
                    'Learn More',
                    style: textTheme.labelSmall!.copyWith(
                      fontSize: smallerThanLaptop
                          ? 12.0
                          : smallerThanDesktop
                          ? 14.0
                          : 16.0,
                      color: AppColors.scaffold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.0),
        if (!isMobile)
          Expanded(
            child: AspectRatio(
              aspectRatio: 660 / 597,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.scaffold,
                      AppColors.lightBlue.withValues(alpha: 0),
                      AppColors.lightBlue,
                    ],
                    stops: [0.0, 0.0, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Transform.translate(
                  offset: Offset(
                    smallerThanLaptop
                        ? -25.0
                        : smallerThanDesktop
                        ? -40.0
                        : -50,
                    0,
                  ),
                  child: Assets.images.chef.image(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
