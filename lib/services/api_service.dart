import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:1337/api/',
      ),
    )..interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: false,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
        ),
        QueuedInterceptorsWrapper(
          onRequest: (
              RequestOptions options,
              RequestInterceptorHandler handler,
              ) {
            final String accessToken = 'b85c1958a87a9fb10e1379f0c7111d04a0e11fa3bb4c09d787e528f09adff16a087c990bb685bf6aa180e205743967c0e3137bdeec584d39c3db5951f23de318e53f5ccc14a6eb8052e759af9ffa2a5878fd6b3f10baece712271b7c5d287814a85999f2997c30b563e5be0e47d80075a24c232ecd818e37766178ac3cfdd99f';
            // final String? accessToken = SecureStorageService.token;

            options.headers['Authorization'] = 'Bearer $accessToken';
                      return handler.next(options);
          },
          onError: (exception, handler) {
            // if (exception.response?.statusCode != 200) {
            //   BotToast.showNotification(
            //     title: (_) =>
            //         Text(exception.response?.data['error']['message']),
            //   );
            // }
            return handler.next(exception);
          },
        ),
      ],
    );
  }
}
