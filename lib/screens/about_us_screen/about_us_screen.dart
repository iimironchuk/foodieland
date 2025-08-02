import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  void _goToBlog(BuildContext context) {
    BlogScreenRoute().go(context);
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
