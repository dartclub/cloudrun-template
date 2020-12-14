import 'dart:async';
import 'dart:io';
import 'package:cloudrun_template/router.dart';

main() {
  runZoned(() async {
    try {
      (await HttpServer.bind(InternetAddress.anyIPv4, 8080))
        ..listen(requestHandler);
    } catch (e) {
      print('error $e');
    }
  });
}
