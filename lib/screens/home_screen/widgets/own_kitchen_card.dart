import 'package:flutter/material.dart';
import 'package:foodieland/gen/assets.gen.dart';

import '../../../resources/app_colors.dart';

class OwnKitchenCard extends StatelessWidget {
  const OwnKitchenCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 540.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Everyone can be a chef in their own kitchen',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim',
                style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
              ),
              SizedBox(height: 72.0,),
              SizedBox(
                height: 60.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Colors.black,
                    foregroundColor: AppColors.scaffold,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Learn More',
                    style: textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: AppColors.scaffold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 660 / 597,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 650,
                    height: 500,
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
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left:30,
                  child: SizedBox(
                    width: 660 ,
                    height: 597,
                    child: Assets.images.chef.image(fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
