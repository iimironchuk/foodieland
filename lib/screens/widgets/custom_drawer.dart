import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:separated_row/separated_row.dart';

import '../../gen/assets.gen.dart';
import '../../providers/services_providers.dart';

class CustomDrawer extends ConsumerWidget {
  final VoidCallback goHome;
  final VoidCallback goToRecipes;
  final VoidCallback goToBlog;
  final VoidCallback goToContacts;
  final VoidCallback goToAboutUs;

  const CustomDrawer({
    super.key,
    required this.goHome,
    required this.goToRecipes,
    required this.goToBlog,
    required this.goToContacts,
    required this.goToAboutUs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      backgroundColor: AppColors.lightBlue,
      child: Column(
        children: [
          SizedBox(height: 40.0),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Divider(),
          ),
          TextButton(onPressed: goHome, child: Text('Home')),
          TextButton(onPressed: goToRecipes, child: Text('Recipes')),
          TextButton(onPressed: goToBlog, child: Text('Blog')),
          TextButton(onPressed: goToContacts, child: Text('Contact')),
          TextButton(onPressed: goToAboutUs, child: Text('About us')),
          Spacer(),
          SeparatedRow(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () =>
                    ref.read(socialLinksServiceProvider).goToFacebook(),
                icon: SvgPicture.asset(Assets.icons.facebook),
              ),
              IconButton(
                onPressed: () =>
                    ref.read(socialLinksServiceProvider).goToTwitter(),
                icon: SvgPicture.asset(Assets.icons.twitter),
              ),
              IconButton(
                onPressed: () =>
                    ref.read(socialLinksServiceProvider).goToInstagram(),
                icon: SvgPicture.asset(Assets.icons.instagarm),
              ),
            ],
            separatorBuilder: (context, index) => SizedBox(width: 20.0),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
