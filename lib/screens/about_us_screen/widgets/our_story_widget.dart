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
                padding:  EdgeInsets.symmetric(horizontal: isMobile ? 0 : 20.0),
                child: Text('''
                At Foodieland, our journey began with a simple yet powerful idea — to bring the joy of cooking into every home. We believe that food is more than just nourishment; it's a universal language that connects people, cultures, and stories.

                What started as a passion project by a group of food lovers has grown into a vibrant community of home cooks, professional chefs, and recipe explorers. We created Foodieland to be your go-to companion in the kitchen — whether you're discovering new flavors, recreating traditional meals, or experimenting with your own creations.

                Our mission is to make cooking accessible, enjoyable, and inspiring for everyone. With carefully curated recipes, easy-to-follow steps, and a touch of culinary creativity, we hope to turn everyday cooking into something extraordinary.

                This is more than an app. It’s a celebration of flavor, family, and the stories that unfold around the table.

                Welcome to Foodieland — where every recipe has a story.

                ''',
                  style: textTheme.labelSmall!.copyWith(
                    fontSize: smallerThanLaptop
                        ? 12.0
                        : smallerThanDesktop
                        ? 14.0
                        : 16.0,
                  ),
                  textAlign: TextAlign.start,
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
