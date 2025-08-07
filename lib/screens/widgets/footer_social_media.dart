import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:separated_row/separated_row.dart';

class FooterSocialMedia extends StatelessWidget {
  final VoidCallback onFacebookTap;
  final VoidCallback onTwitterTap;
  final VoidCallback onInstagramTap;

  const FooterSocialMedia({
    super.key,
    required this.onFacebookTap,
    required this.onTwitterTap,
    required this.onInstagramTap,
  });

  @override
  Widget build(BuildContext context) {
    return SeparatedRow(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onFacebookTap,
          icon: SvgPicture.asset(Assets.icons.facebook),
        ),
        IconButton(
          onPressed: onTwitterTap,
          icon: SvgPicture.asset(Assets.icons.twitter),
        ),
        IconButton(
          onPressed: onInstagramTap,
          icon: SvgPicture.asset(Assets.icons.instagarm),
        ),
      ],
      separatorBuilder: (_, _) => SizedBox(width: 40.0),
    );
  }
}
