import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/widgets/custom_drawer.dart';
import 'package:foodieland/screens/widgets/footer.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:separated_row/separated_row.dart';

class AppWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppWrapper({super.key, required this.navigationShell});

  void _goToBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    return Scaffold(
      endDrawer: CustomDrawer(
        goHome: () => _goToBranch(0),
        goToRecipes: () => _goToBranch(1),
        goToBlog: () => _goToBranch(2),
        goToContacts: () => _goToBranch(3),
        goToAboutUs: () => _goToBranch(4),
      ),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          automaticallyImplyLeading: false,
          actions: [Container()],
          backgroundColor: Colors.white,
          title: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1280.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _goToBranch(0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Foodieland',
                            style: textTheme.titleMedium,
                          ),
                          TextSpan(
                            text: '.',
                            style: textTheme.titleMedium!.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!smallerThanLaptop)
                    SeparatedRow(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () => _goToBranch(0),
                          child: Text('Home'),
                        ),
                        TextButton(
                          onPressed: () => _goToBranch(1),
                          child: Text('Recipes'),
                        ),
                        TextButton(
                          onPressed: () => _goToBranch(2),
                          child: Text('Blog'),
                        ),
                        TextButton(
                          onPressed: () => _goToBranch(3),
                          child: Text('Contact'),
                        ),
                        TextButton(
                          onPressed: () => _goToBranch(4),
                          child: Text('About us'),
                        ),
                      ],
                      separatorBuilder: (context, index) =>
                          SizedBox(width: smallerThanDesktop ? 30.0 : 60.0),
                    ),
                  if (!smallerThanLaptop)
                    SeparatedRow(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.icons.facebook),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.icons.twitter),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.icons.instagarm),
                        ),
                      ],
                      separatorBuilder: (context, index) =>
                          SizedBox(width: smallerThanDesktop ? 15.0 : 40.0),
                    ),
                  if (smallerThanLaptop)
                    Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                          icon: SvgPicture.asset(
                            Assets.icons.drawer,
                            colorFilter: ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                        );
                      }
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: AppColors.dividerColor),
            navigationShell,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: smallerThanDesktop ? 10.0 : 0),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1280.0),
                  child: Footer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
