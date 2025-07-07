import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:foodieland/services/api_service.dart';

class SubscriptionRepository {
  static final SubscriptionRepository instance =
      SubscriptionRepository._internal();

  factory SubscriptionRepository() => instance;

  SubscriptionRepository._internal();

  final Dio _dio = ApiService().dio;

  Future<void> createSubscription({required String email}) async {
    try {
      final response = await _dio.post(
        'subscriptions',
        data: {
          'data': {'email': email},
        },
      );

      if (response.statusCode == 201) {
        print('Subscription created!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
