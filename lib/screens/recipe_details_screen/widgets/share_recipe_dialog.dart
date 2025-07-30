import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/share_item.dart';
import 'package:separated_row/separated_row.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareRecipeDialog extends StatelessWidget {
  const ShareRecipeDialog({super.key});

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: Uri.base.toString()));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Link copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareToFacebook() async {
    final urlToShare = Uri.base;
    final fbShareUrl = Uri.parse('https://www.facebook.com/sharer/sharer.php?u=$urlToShare');
    if (await canLaunchUrl(fbShareUrl)) {
      await launchUrl(fbShareUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $fbShareUrl';
    }
  }

  void _shareToTwitter() async {
    final urlToShare = Uri.base;
    final twitterUrl = Uri.parse(
      'https://twitter.com/intent/tweet?url=$urlToShare',
    );
    if (await canLaunchUrl(twitterUrl)) {
      await launchUrl(twitterUrl, mode: LaunchMode.externalApplication);
    }
  }

  void _shareToWhatsApp() async {
    final urlToShare = Uri.base.toString();

    final whatsappUrl = Uri.parse('https://wa.me/?text=${Uri.encodeComponent(urlToShare)}');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 700.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.lightBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Share link',
                style: textTheme.labelMedium!.copyWith(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              SeparatedRow(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShareItem(
                    backgroundColor: Color(0xFF3c5997),
                    asset: Assets.icons.facebook,
                    onTap: _shareToFacebook,
                  ),
                  ShareItem(
                    backgroundColor: Color(0xFF189cf1),
                    asset: Assets.icons.twitter,
                    onTap: _shareToTwitter,
                  ),
                  ShareItem(
                    backgroundColor: Color(0xFF29d045),
                    asset: Assets.icons.whatsapp,
                    onTap: _shareToWhatsApp,
                  ),
                ],
                separatorBuilder: (_, _) => SizedBox(width: 20.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightGrey.withValues(alpha: 0.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: TextEditingController(
                            text: Uri.base.toString(),
                          ),
                          readOnly: true,
                          style: textTheme.labelSmall!.copyWith(fontSize: 18.0),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          scrollPhysics: const BouncingScrollPhysics(),
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () => _copyToClipboard(context),
                    icon: Icon(Icons.copy, color: AppColors.lightGrey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
