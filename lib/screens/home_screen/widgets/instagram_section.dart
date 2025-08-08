import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InstagramSection extends StatelessWidget {
  final VoidCallback goToInstagram;

  InstagramSection({super.key, required this.goToInstagram});

  final List<Widget> instagramPosts = [
    Assets.images.instagramPost1.image(),
    Assets.images.instagramPost2.image(),
    Assets.images.instagramPost3.image(),
    Assets.images.instagramPost4.image(),
  ];

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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.scaffold, AppColors.lightBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 860.0),
            child: Column(
              children: [
                Text(
                  'Check out @foodieland on Instagram',
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: smallerThanLaptop
                        ? 24.0
                        : smallerThanDesktop
                        ? 36.0
                        : 48.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 15.0 : 0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim ',
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
              ],
            ),
          ),SizedBox(height: 24.0),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1280.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: smallerThanDesktop ? 20.0 : 0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: smallerThanLaptop ? 2 : 4,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 40.0,
                  childAspectRatio: 290 / 445,
                ),
                itemCount: instagramPosts.length,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 290/445,
                      child: instagramPosts[index]);
                },
              ),
            ),
          ),
          SizedBox(height: 80.0),
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
              onPressed: goToInstagram,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Visit Our Instagram',
                    style: textTheme.labelSmall!.copyWith(
                      fontSize: smallerThanLaptop
                          ? 12.0
                          : smallerThanDesktop
                          ? 14.0
                          : 16.0,
                      color: AppColors.scaffold,
                    ),
                  ),
                  SizedBox(width: smallerThanLaptop ? 8.0 : 16.0),
                  SvgPicture.asset(
                    Assets.icons.instagarm,
                    colorFilter: ColorFilter.mode(
                      AppColors.scaffold,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
