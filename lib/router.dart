import 'dart:io';

typedef Future<void> Route(HttpRequest request);
final Map<String, Route> routes = {
  '/': (HttpRequest request) async {
    request.response
      ..write('nothing here.')
      ..close();
  }
};

Future<void> onNotFound(HttpRequest request) async {
  request.response
    ..statusCode = 404
    ..write('file not found.')
    ..close();
}

Future<void> onInternalError(HttpRequest request) async {
  request.response
    ..statusCode = 500
    ..write('internal server error.')
    ..close();
}

requestHandler(HttpRequest request) async {
  try {
    Route handler = onNotFound;
    for (String path in routes.keys) {
      if (request.requestedUri.path == path) {
        handler = routes[path];
      }
    }
    await handler(request);
  } catch (e) {
    print(e);
    await onInternalError(request);
  }
}
