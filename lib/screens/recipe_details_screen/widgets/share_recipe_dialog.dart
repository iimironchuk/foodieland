import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/providers/services_providers.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/share_item.dart';
import 'package:separated_row/separated_row.dart';

class ShareRecipeDialog extends ConsumerWidget {
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

  void _shareToFacebook(WidgetRef ref) async {
    final urlToShare = Uri.base;
    await ref.read(shareServiceProvider).facebookShare(urlToShare: urlToShare);
  }

  void _shareToTwitter(WidgetRef ref) async {
    final urlToShare = Uri.base;
    await ref.read(shareServiceProvider).twitterShare(urlToShare: urlToShare);
  }

  void _shareToWhatsApp(WidgetRef ref) async {
    final urlToShare = Uri.base.toString();
    await ref.read(shareServiceProvider).whatsAppShare(urlToShare: urlToShare);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    onTap: () => _shareToFacebook(ref),
                  ),
                  ShareItem(
                    backgroundColor: Color(0xFF189cf1),
                    asset: Assets.icons.twitter,
                    onTap: () => _shareToTwitter(ref),
                  ),
                  ShareItem(
                    backgroundColor: Color(0xFF29d045),
                    asset: Assets.icons.whatsapp,
                    onTap: () => _shareToWhatsApp(ref),
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
