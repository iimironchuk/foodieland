import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/widgets/footer.dart';
import 'package:separated_row/separated_row.dart';

import 'gen/fonts.gen.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
backgroundColor: Colors.white,
          title: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1280.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
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
                  SeparatedRow(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Home')),
                      TextButton(onPressed: () {}, child: Text('Recipes')),
                      TextButton(onPressed: () {}, child: Text('Blog')),
                      TextButton(onPressed: () {}, child: Text('Contact')),
                      TextButton(onPressed: () {}, child: Text('About us')),
                    ],
                    separatorBuilder: (context, index) => SizedBox(width: 60.0),
                  ),
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
                    separatorBuilder: (context, index) => SizedBox(width: 40.0),
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
            child,
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1280.0),
                child: Footer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
