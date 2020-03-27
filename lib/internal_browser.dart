import 'dart:async';

import 'package:flutter/services.dart';

class InternalBrowser {
  static const MethodChannel _channel = MethodChannel('internal_browser');

  static Future<void> open(String url) async =>
      await _channel.invokeMethod('open', url);
}
