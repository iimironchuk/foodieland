import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/providers/favorites_provider/favorites_provider.dart';
import 'package:foodieland/providers/random_other_recipes_provider/random_other_recipes_provider.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/contact_screen/widgets/form_section.dart';
import 'package:foodieland/screens/widgets/other_recipes_grid.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'contact_screen_providers/contact_screen_providers.dart';

class ContactScreen extends ConsumerWidget {
  const ContactScreen({super.key});

  Future<void> _onSubmit(WidgetRef ref) async {
    final name = ref.watch(contactNameProvider);
    final email = ref.watch(contactEmailProvider);
    final subject = ref.watch(contactSubjectProvider);
    final enquiry = ref.watch(contactEnquiryProvider);
    final message = ref.watch(contactMessageProvider);

    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    
    if(name.isEmpty || email.isEmpty || subject.isEmpty || enquiry.isEmpty || message.isEmpty){

      BotToast.showText(text: 'All fields required');
    } else if (!emailRegex.hasMatch(email)){
      BotToast.showText(text: 'Invalid email format');
    } else{
      await ref.read(createContactProvider.future);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherRecipesAsync = ref.watch(randomOtherRecipesProvider);
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final textTheme = Theme.of(context).textTheme;
    double bigSizedBoxHeight() {
      return isMobile
          ? 40.0
          : smallerThanDesktop
          ? 80.0
          : 160.0;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: smallerThanDesktop ? 15.0 : 0.0,
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
                'Contact us',
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
                    ? 24.0
                    : smallerThanDesktop
                    ? 48.0
                    : 72.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (!smallerThanLaptop)
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(231, 249, 253, 0),
                              AppColors.lightBlue,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Assets.images.contactPageCook.image(
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  if (!smallerThanLaptop) SizedBox(width: 40.0),
                  Expanded(flex: 2, child: FormSection()),
                ],
              ),
              SizedBox(height: 48.0),
              SizedBox(
                height: isMobile ? 44.0 : 64.0,
                width: isMobile ? 100.0 : 180.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isMobile ? 8 : 16),
                    ),
                  ),
                  onPressed: () => _onSubmit(ref),
                  child: Text('Submit'),
                ),
              ),
              SizedBox(height: bigSizedBoxHeight()),
              SubscriptionSection(),
              SizedBox(height: bigSizedBoxHeight()),
              Text(
                'Check out the delicious recipe',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: isMobile
                      ? 18.0
                      : smallerThanDesktop
                      ? 24.0
                      : 36.0,
                ),
              ),
              SizedBox(
                height: isMobile
                    ? 20.0
                    : smallerThanDesktop
                    ? 40.0
                    : 80.0,
              ),
              otherRecipesAsync.when(
                data: (recipes) => OtherRecipesGrid(
                  recipes: recipes,
                  toggleFavorite: (recipe) =>
                      ref.read(favoriteRecipesProvider.notifier).toggle(recipe),
                ),
                error: (error, stack) => Text('Error: $error'),
                loading: () => CircularProgressIndicator(),
              ),
              SizedBox(height: bigSizedBoxHeight()),
            ],
          ),
        ),
      ),
    );
  }
}
