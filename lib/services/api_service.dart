import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://strapi2.demodev.cc/api/',
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
            final String accessToken = '8f08666c3f8e1aefb95317160837393a69d05b268dc04ca7108fdae2b8dd9514ec0279a5c4f61507a00f372b8f3e3c7e970fd79418f3e083a5faad0753fac365947e6c855928d30ef28c1c35ccc390b0943771e1af3ad62bf03404dfa397396c2201c4b73dd522c73d76a319fc2886b4ec2d926bd0535f4c5abeb942ed7c88ef';
            // final String? accessToken = SecureStorageService.token;

            options.headers['Authorization'] = 'Bearer $accessToken';
                      return handler.next(options);
          },
          onError: (exception, handler) {
            if (exception.response?.statusCode != 200) {
              BotToast.showNotification(
                title: (_) =>
                    Text(exception.response?.data['error']['message']),
              );
            }
            return handler.next(exception);
          },
        ),
      ],
    );
  }
}
