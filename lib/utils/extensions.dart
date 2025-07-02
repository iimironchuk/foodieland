import 'dart:ui';

import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isSuccess => statusCode == 200;
}

extension HexToColor on String {
  Color toColor() {
    String hex = replaceAll('#', '');

    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    return Color(
      int.parse(
        hex,
        radix: 16,
      ),
    );
  }
}