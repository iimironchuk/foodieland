import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/providers/subscription_provider/subscription_provider.dart';
import 'package:foodieland/resources/app_colors.dart';

class SubscriptionSection extends ConsumerWidget {
  SubscriptionSection({super.key});

  final TextEditingController _emailController = TextEditingController();

  Future<void> _subscribe(WidgetRef ref) async {

      final email = _emailController.text.trim();

      if (email.isNotEmpty) {
        await ref.read(subscribeProvider(email).future);
      } else {
        return;
      }

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: 1280 / 442,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: AppColors.lightBlue,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Deliciousness to your inbox',
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      SizedBox(
                        width: 620.0,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim ',
                          style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 64.0),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 480.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.scaffold,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _emailController,

                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        left: 22.0,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Your email address...',
                                      hintStyle: textTheme.labelSmall!
                                          .copyWith(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60.0,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          16,
                                        ),
                                      ),
                                      backgroundColor: Colors.black,
                                      foregroundColor: AppColors.scaffold,
                                    ),
                                    onPressed: () => _subscribe(ref, ),
                                    child: Text(
                                      'Subscribe',
                                      style: textTheme.labelSmall!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                        color: AppColors.scaffold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: -100,
              bottom: -100,
              child: Transform.rotate(
                angle: 0.5,
                child: Assets.images.salad1.image(width: 410, height: 400.0),
              ),
            ),

            Positioned(
              right: -70,
              bottom: -70,
              child: Assets.images.salad2.image(width: 470.0, height: 355.0),
            ),
          ],
        ),
      ),
    );
  }
}
