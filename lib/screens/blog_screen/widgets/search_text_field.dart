import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onSearch;
  final Function(String)? onSubmitted;
  final TextEditingController _controller = TextEditingController();

  SearchTextField({super.key, required this.onSearch, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      constraints: BoxConstraints(maxWidth: 700.0),
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: AppColors.veryLightGrey),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: TextField(
                controller: _controller,
                onSubmitted: onSubmitted,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search article, news or recipe...',
                  hintStyle: textTheme.labelSmall,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 160.0,
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
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
