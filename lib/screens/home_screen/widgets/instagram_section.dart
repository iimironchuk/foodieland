import 'package:flutter/material.dart';
import 'package:foodieland/resources/app_colors.dart';

class InstagramSection extends StatelessWidget {
  const InstagramSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.scaffold, AppColors.lightBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
        ),
      ),
    );
  }
}
