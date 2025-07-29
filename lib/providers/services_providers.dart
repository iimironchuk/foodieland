import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/services/pdf_service/pdf_service.dart';
import 'package:foodieland/services/shared_preferences_service.dart';

final sharedPreferencesProvider = Provider((ref){
  return SharedPreferencesService();
});

final pdfServiceProvider = Provider((ref){
  return PdfService();
});