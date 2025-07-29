import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/blog_screen/blog_screen_providers/post_providers/post_providers.dart';
import 'package:foodieland/screens/blog_screen/blog_screen_providers/text_provider/text_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageButtonsRow extends ConsumerStatefulWidget {
  final int pageCount;

  const PageButtonsRow({super.key, required this.pageCount});

  @override
  ConsumerState<PageButtonsRow> createState() => _PageButtonsRowState();
}

class _PageButtonsRowState extends ConsumerState<PageButtonsRow> {
  int currentPageNumber = 1;

  List<Widget> _buildPageButtons(TextTheme textTheme) {
    List<Widget> buttons = [];

    const int maxVisible = 5;
    final int total = widget.pageCount;

    buttons.add(_buildButton(1, textTheme));

    int start = currentPageNumber - 1;
    int end = currentPageNumber + 1;

    if (start <= 2) {
      start = 2;
      end = start + maxVisible - 2;
    }

    if (end >= total - 1) {
      end = total - 1;
      start = end - maxVisible + 1;
      if (start < 2) start = 2;
    }

    if (start > 2) {
      buttons.add(_buildButton('...', textTheme));
    }

    for (int i = start; i <= end; i++) {
      buttons.add(_buildButton(i, textTheme));
    }

    if (end < total - 1) {
      buttons.add(_buildButton('...', textTheme));
    }

    if (total > 1) {
      buttons.add(_buildButton(total, textTheme));
    }

    return buttons;
  }

  void selectPage(int pageNumber) {
    final searchedText = ref.read(textProvider);
    ref
        .read(postOverviewProvider(searchedText).notifier)
        .getPostsOnSelectedPage(selectedPage: pageNumber);

    setState(() {
      currentPageNumber = pageNumber;
    });
  }

  Widget _buildButton(dynamic pageNumber, TextTheme textTheme) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: pageNumber is int ? () => selectPage(pageNumber) : () {},

        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: currentPageNumber == pageNumber
                  ? Colors.transparent
                  : AppColors.veryLightGrey,
            ),
            borderRadius: BorderRadius.circular(
              isMobile
                  ? 8
                  : isTablet
                  ? 12
                  : 16,
            ),
            color: currentPageNumber == pageNumber
                ? Colors.black
                : Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(
            vertical: isMobile
                ? 10.0
                : isTablet
                ? 15.0
                : 20.0,
            horizontal: isMobile
                ? 10.0
                : isTablet
                ? 20.0
                : 30.0,
          ),
          child: Text(
            '$pageNumber',
            style: textTheme.labelMedium!.copyWith(
              fontSize: isMobile
                  ? 10.0
                  : isTablet
                  ? 15.0
                  : 18.0,
              color: currentPageNumber == pageNumber
                  ? AppColors.scaffold
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    return SizedBox(
      height: isMobile
          ? 32.0
          : isTablet
          ? 48.0
          : 64.0,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: _buildPageButtons(textTheme),
      ),
    );
  }
}
