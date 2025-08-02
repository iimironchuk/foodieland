import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final int maxLines;
  final double? contentTopPadding;
  final double? contentBottomPadding;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.title,
    required this.maxLines,
    this.contentTopPadding, this.contentBottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: textTheme.labelSmall!.copyWith(fontSize: 12.0)),
        SizedBox(height: 12.0),
        Container(
          // height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.dividerColor),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 20.0,
                top: contentTopPadding ?? 0,
                bottom: contentBottomPadding ?? 0,
              ),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: textTheme.labelSmall,

              // isDense: true
            ),
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
