import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/services/pdf_service/pdf_service.dart';
import 'package:foodieland/services/share_service.dart';
import 'package:foodieland/services/shared_preferences_service.dart';
import 'package:foodieland/services/social_links_service.dart';

final sharedPreferencesProvider = Provider((ref) {
  return SharedPreferencesService();
});

final pdfServiceProvider = Provider((ref) {
  return PdfService();
});

final shareServiceProvider = Provider((ref) => ShareService());

final socialLinksServiceProvider = Provider((ref) => SocialLinksService());
