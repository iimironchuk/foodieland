import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';

class InstagramSection extends StatelessWidget {
  InstagramSection({super.key});

  final List<Widget> instagramPosts = [
    Assets.images.instagramPost1.image(),
    Assets.images.instagramPost2.image(),
    Assets.images.instagramPost3.image(),
    Assets.images.instagramPost4.image(),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 80.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 860.0),
              child: Column(
                children: [
                  Text(
                    'Check out @foodieland on Instagram',
                    style: textTheme.labelMedium,
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim ',
                    style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 40.0,
              crossAxisSpacing: 40.0,
              childAspectRatio: 290 / 445,
            ),
            itemCount: instagramPosts.length,
            itemBuilder: (context, index) {
              return instagramPosts[index];
            },
          ),
          // Wrap(
          //   spacing: 40.0,
          //   children: [
          //     ...instagramPosts.map(
          //       (post) => SizedBox(
          //         width: 290.0,
          //           child: AspectRatio(aspectRatio: 290 / 445, child: post)),
          //     ),
          //   ],
          // ),
          SizedBox(height: 80.0),
          SizedBox(
            height: 60.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Visit Our Instagram'),
                  SizedBox(width: 16.0),
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
