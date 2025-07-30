import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/resources/app_colors.dart';

class ShareItem extends StatelessWidget {
  final Color backgroundColor;
  final String asset;
  final VoidCallback onTap;

  const ShareItem({
    super.key,
    required this.backgroundColor,
    required this.asset, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SvgPicture.asset(
              asset,
              colorFilter: ColorFilter.mode(AppColors.scaffold, BlendMode.srcIn),
              width: 50.0,
              height: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
