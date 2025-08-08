import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/navigation/routes.dart';
import 'package:foodieland/screens/about_us_screen/widgets/our_story_widget.dart';
import 'package:foodieland/screens/home_screen/widgets/instagram_section.dart';
import 'package:foodieland/screens/home_screen/widgets/own_kitchen_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends ConsumerWidget {
  const AboutUsScreen({super.key});

  void _openInstagramProfile() async {
    final String username = 'epic.lviv';
    final Uri igAppUrl = Uri.parse('instagram://user?username=$username');
    final Uri igWebUrl = Uri.parse('https://instagram.com/$username');

    if (await canLaunchUrl(igAppUrl)) {
      await launchUrl(igAppUrl, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(igWebUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1280.0),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: smallerThanDesktop ? 15.0 : 0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: isMobile
                        ? 20.0
                        : smallerThanDesktop
                        ? 40.0
                        : 80.0,
                  ),

                  Text(
                    'About us',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: isMobile
                          ? 24.0
                          : smallerThanDesktop
                          ? 48.0
                          : 64.0,
                    ),
                  ),
                  SizedBox(
                    height: isMobile
                        ? 20.0
                        : smallerThanDesktop
                        ? 40.0
                        : 80.0,
                  ),

                  OurStoryWidget(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: isMobile
                ? 20.0
                : smallerThanDesktop
                ? 40.0
                : 80.0,
          ),
          Text(
            'Why us?',
            style: textTheme.labelMedium!.copyWith(
              fontSize: isMobile
                  ? 24.0
                  : smallerThanDesktop
                  ? 48.0
                  : 64.0,
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 40.0),
            child: Text(
              '''
At Foodieland, we know that cooking isn't just about following recipes — it's about discovering flavors, creating memories, and enjoying the journey. Here’s why thousands of food lovers choose us every day:

1) Curated Recipes for Every Taste
From quick weekday dinners to gourmet weekend treats — we offer a wide range of recipes tailored to your preferences and skill level.

2) Global Cuisine at Your Fingertips
Explore dishes from all over the world without leaving your kitchen. Whether it’s Italian pasta or Thai curry, we’ve got you covered.

3) Step-by-Step Guidance
Our recipes are easy to follow, even for beginners. With clear instructions, photos, and cooking tips, you'll feel confident in every dish you make.

4) Personalized Experience
Get recommendations based on your taste, dietary needs, and cooking history. Foodieland grows with you.

5) Created by Food Lovers, for Food Lovers
Our team is passionate about food and dedicated to bringing you the best cooking experience possible — from real cooks to real people.

6) Modern, User-Friendly App
Designed with simplicity and beauty in mind, Foodieland makes finding and saving your favorite recipes effortless.
Join our community and discover how fun, flavorful, and fulfilling cooking can be — only with Foodieland.
          ''',
              style: textTheme.labelSmall!.copyWith(
                fontSize: smallerThanLaptop
                    ? 12.0
                    : smallerThanDesktop
                    ? 14.0
                    : 16.0,
              ),
            ),
          ),
          SizedBox(
            height: isMobile
                ? 20.0
                : smallerThanDesktop
                ? 40.0
                : 80.0,
          ),
          InstagramSection(goToInstagram: _openInstagramProfile),
          SizedBox(
            height: isMobile
                ? 20.0
                : smallerThanDesktop
                ? 40.0
                : 80.0,
          ),
        ],
      ),
    );
  }
}
