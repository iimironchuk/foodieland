import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/app_colors.dart';

class OurStoryWidget extends StatelessWidget {
  const OurStoryWidget({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Our story',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim. Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim',
                  style: textTheme.labelSmall!.copyWith(
                    fontSize: smallerThanLaptop
                        ? 12.0
                        : smallerThanDesktop
                        ? 14.0
                        : 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: smallerThanLaptop
                    ? 24.0
                    : smallerThanDesktop
                    ? 48.0
                    : 72.0,
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
