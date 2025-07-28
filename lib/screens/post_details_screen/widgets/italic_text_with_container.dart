import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ItalicTextWithContainer extends StatelessWidget {
  final String text;
  const ItalicTextWithContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding:  EdgeInsets.only(bottom: isMobile ? 30.0 : 60.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(0, 0, 0, 0.1), Colors.transparent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 40.0,
            vertical: isMobile ? 24.0 : 48.0,
          ),
          child: Text(
            text,
            style: textTheme.labelMedium!.copyWith(
              fontSize: isMobile ? 18.0 : smallerThanLaptop ? 24.0 : 36.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
