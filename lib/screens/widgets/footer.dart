import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 16.0),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetuipisicing elit,',
                      style: textTheme.labelSmall,
                    ),
                  ],
                ),
                Wrap(
                  spacing: 60.0,
                  runSpacing: 15.0,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Recipes')),
                    TextButton(onPressed: () {}, child: Text('Blog')),
                    TextButton(onPressed: () {}, child: Text('Contact')),
                    TextButton(onPressed: () {}, child: Text('About us')),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Divider(color: AppColors.dividerColor),
            ),
            Text.rich(
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
            ),
          ],
        ),
      ),
    );
  }
}
