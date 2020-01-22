import 'dart:io';
import 'package:cloudrun_template/router.dart';

main() async {
  try {
    await HttpServer.bind(
      InternetAddress.loopbackIPv4,
      int.tryParse(Platform.environment['PORT']) ?? 8080,
    )
      ..listen(requestHandler);
  } catch (e) {
    print(e);
  }
}
