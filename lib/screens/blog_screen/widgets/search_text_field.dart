import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onSearch;
  final Function(String)? onSubmitted;
  final TextEditingController _controller = TextEditingController();

  SearchTextField({super.key, required this.onSearch, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    return Container(
      constraints: BoxConstraints(maxWidth: 700.0),
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        borderRadius: BorderRadius.circular(isMobile ? 18.0 : 24.0),
        border: Border.all(color: AppColors.veryLightGrey),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: isMobile
                    ? 16.0
                    : isTablet
                    ? 24.0
                    : 32.0,
              ),
              child: TextField(
                controller: _controller,
                onSubmitted: onSubmitted,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search article, news or recipe...',
                  hintStyle: textTheme.labelSmall!.copyWith(fontSize: isMobile ? 12.0 : 14.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 5.0 : 10.0),
            child: SizedBox(
              width: isMobile
                  ? 100.0
                  : isTablet
                  ? 120.0
                  : 160.0,
              height: isMobile
                  ? 40.0
                  : isTablet
                  ? 50.0
                  : 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isMobile ? 16.0 : 20.0),
                  ),
                  textStyle: TextStyle(fontSize: isMobile ? 14.0 : 16.0),
                ),
                onPressed: () {
                  final text = _controller.text;
                  onSearch(text);
                },
                child: Text('Search'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
