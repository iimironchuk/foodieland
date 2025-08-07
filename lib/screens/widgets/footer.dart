import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/providers/services_providers.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/widgets/footer_social_media.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_row/separated_row.dart';

class Footer extends ConsumerWidget {
  final VoidCallback goToRecipes;
  final VoidCallback goToBlog;
  final VoidCallback goToContacts;
  final VoidCallback goToAboutUs;
  final VoidCallback onLabelTap;

  const Footer({
    super.key,
    required this.goToRecipes,
    required this.goToBlog,
    required this.goToContacts,
    required this.goToAboutUs,
    required this.onLabelTap,
  });

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
        separatorBuilder: (context, index) => SizedBox(
          width: smallerThanLaptop
              ? 5.0
              : smallerThanDesktop
              ? 30.0
              : 60.0,
        ),
        children: [
          TextButton(onPressed: goToRecipes, child: Text('Recipes')),
          TextButton(onPressed: goToBlog, child: Text('Blog')),
          TextButton(onPressed: goToContacts, child: Text('Contact')),
          TextButton(onPressed: goToAboutUs, child: Text('About us')),
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

  Widget _buildSocialMediaContent(
    TextTheme textTheme,
    bool smallerThanLaptop,
    WidgetRef ref,
  ) {
    final children = [
      Positioned(
        right: 0,
        left: 0,
        child: GestureDetector(
          onTap: onLabelTap,
          child: Text.rich(
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
            textAlign: TextAlign.center,
          ),
        ),
      ),
      if (smallerThanLaptop) SizedBox(height: 20.0),
      Positioned(
        right: 0,
        child: FooterSocialMedia(
          onFacebookTap: () => ref.read(socialLinksServiceProvider).goToFacebook(),
          onTwitterTap: () => ref.read(socialLinksServiceProvider).goToTwitter(),
          onInstagramTap: () => ref.read(socialLinksServiceProvider).goToInstagram(),
        ),
      ),
      if (smallerThanLaptop) SizedBox(height: 20.0),
    ];

    return smallerThanLaptop
        ? Column(mainAxisSize: MainAxisSize.min, children: children)
        : SizedBox(height: 120.0, child: Stack(children: children));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            _buildSocialMediaContent(textTheme, smallerThanLaptop, ref),
          ],
        ),
      ),
    );
  }
}
