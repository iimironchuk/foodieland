import 'package:url_launcher/url_launcher.dart';

class SocialLinksService {
  Future<void> goToInstagram() async {
    final String username = 'epic.lviv';
    final Uri igAppUrl = Uri.parse('instagram://user?username=$username');
    final Uri igWebUrl = Uri.parse('https://instagram.com/$username');

    if (await canLaunchUrl(igAppUrl)) {
      await launchUrl(igAppUrl, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(igWebUrl, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> goToTwitter() async {
    final String username = 'FoodPleaser';
    final Uri twitterUrl = Uri.parse('https://twitter.com/$username');

    if (await canLaunchUrl(twitterUrl)) {
      await launchUrl(twitterUrl, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> goToFacebook() async {
    final Uri twitterUrl = Uri.parse('https://www.facebook.com/groups/360026879163052/');

    if (await canLaunchUrl(twitterUrl)) {
      await launchUrl(twitterUrl, mode: LaunchMode.externalApplication);
    }
  }


}