import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/providers/subscription_provider/subscription_provider.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SubscriptionSection extends ConsumerWidget {
  SubscriptionSection({super.key});

  final TextEditingController _emailController = TextEditingController();

  Future<void> _subscribe(WidgetRef ref) async {
    final email = _emailController.text.trim();
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if(email.isEmpty){
      BotToast.showText(text: 'Enter your email to subscribe');
    } else if (!emailRegex.hasMatch(email)){
      BotToast.showText(text: 'Invalid format');
    } else{
      await ref.read(subscribeProvider(email).future);
      BotToast.showText(text: 'Thanks for subscription');
    }
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
    final isSmallLaptop =
        MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width > 800;

    final isSmallTablet = MediaQuery.of(context).size.width < 650;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return AspectRatio(
      aspectRatio: isMobile
          ? 1280 / 1050
          : isSmallTablet
          ? 1280 / 850
          : smallerThanLaptop
          ? 1280 / 650
          : isSmallLaptop
          ? 1280 / 550
          : 1280 / 442,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          smallerThanLaptop
              ? 15
              : smallerThanDesktop
              ? 30
              : 60,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(color: AppColors.lightBlue),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Deliciousness to your inbox',
                          style: textTheme.labelMedium!.copyWith(
                            fontSize: smallerThanLaptop
                                ? 24.0
                                : smallerThanDesktop
                                ? 36.0
                                : 48.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: smallerThanLaptop
                              ? 12.0
                              : smallerThanDesktop
                              ? 18.0
                              : 24.0,
                        ),
                        SizedBox(
                          width: 620.0,
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
                        SizedBox(
                          height: isMobile
                              ? 20.0
                              : smallerThanLaptop
                              ? 36.0
                              : smallerThanDesktop
                              ? 48.0
                              : 64.0,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: isMobile
                                ? 280.0
                                : smallerThanLaptop
                                ? 380.0
                                : smallerThanDesktop
                                ? 430.0
                                : 480.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.scaffold,
                              borderRadius: BorderRadius.circular(
                                smallerThanLaptop
                                    ? 10.0
                                    : smallerThanDesktop
                                    ? 16.0
                                    : 24.0,
                              ),
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
                                          left: smallerThanLaptop ? 11 : 22.0,
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
                                    height: smallerThanLaptop
                                        ? 40.0
                                        : smallerThanDesktop
                                        ? 50.0
                                        : 60.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            smallerThanLaptop ? 8 : 16,
                                          ),
                                        ),
                                        backgroundColor: Colors.black,
                                        foregroundColor: AppColors.scaffold,
                                      ),
                                      onPressed: () => _subscribe(ref),
                                      child: Text(
                                        'Subscribe',
                                        style: textTheme.labelSmall!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: smallerThanLaptop
                                              ? 10.0
                                              : smallerThanDesktop
                                              ? 12.0
                                              : 14.0,
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
            ),
            if (!isMobile)
              Positioned(
                left: smallerThanLaptop
                    ? -180
                    : isSmallLaptop
                    ? -150
                    : -110,
                bottom: smallerThanLaptop
                    ? -160
                    : isSmallLaptop
                    ? -150
                    : -110,
                child: Transform.rotate(
                  angle: 0.5,
                  child: Transform.scale(
                    scale: smallerThanLaptop
                        ? 0.5
                        : smallerThanDesktop
                        ? 0.6
                        : 0.9,
                    child: Assets.images.salad1.image(
                      width: 410,
                      height: 400.0,
                    ),
                  ),
                ),
              ),

            if (!isMobile)
              Positioned(
                right: smallerThanLaptop
                    ? -180
                    : isSmallLaptop
                    ? -120
                    : -100,
                bottom: smallerThanLaptop
                    ? -130
                    : isSmallLaptop
                    ? -100
                    : -90,
                child: Transform.scale(
                  scale:  smallerThanLaptop
                      ? 0.6
                      : isSmallLaptop ? 0.7 : smallerThanDesktop
                      ? 0.8
                      : 0.9,
                  child: Assets.images.salad2.image(
                    width: 470.0,
                    height: 355.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
