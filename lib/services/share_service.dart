import 'package:url_launcher/url_launcher.dart';

class ShareService {

  Future<void> whatsAppShare({required String urlToShare}) async {

    final whatsappUrl = Uri.parse('https://wa.me/?text=${Uri.encodeComponent(urlToShare)}');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> twitterShare({required Uri urlToShare}) async {
    final twitterUrl = Uri.parse(
      'https://twitter.com/intent/tweet?url=$urlToShare',
    );
    if (await canLaunchUrl(twitterUrl)) {
      await launchUrl(twitterUrl, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> facebookShare({required Uri urlToShare}) async {
    final fbShareUrl = Uri.parse('https://www.facebook.com/sharer/sharer.php?u=$urlToShare');
    if (await canLaunchUrl(fbShareUrl)) {
      await launchUrl(fbShareUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $fbShareUrl';
    }
  }

  Future<void> instagramShare() async {
    final fbShareUrl = Uri.parse('https://www.instagram.com/direct/new/');
    if (await canLaunchUrl(fbShareUrl)) {
      await launchUrl(fbShareUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $fbShareUrl';
    }
  }
}