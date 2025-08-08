import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';

import '../services/api_service.dart';

class ContactRepository {
  static final ContactRepository _instance = ContactRepository._internal();

  factory ContactRepository() => _instance;

  final Dio _dio = ApiService().dio;

  ContactRepository._internal();

  Future<void> createContact({
    required String name,
    required String email,
    required String subject,
    required String enquiry,
    required String message,
  }) async {
    try {
      final response = await _dio.post(
        'contacts',
        data: {
          'data': {
            'name': name,
            'email': email,
            'subject': subject,
            'enquiry': enquiry,
            'message': message,
          },
        },
      );

      if (response.statusCode == 201) {
        BotToast.showText(text: 'Contact created!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
