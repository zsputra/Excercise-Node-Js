import 'dart:io';

class BackendError extends HttpException {
  final int code;
  final String method;
  final String body;

  BackendError({
    String message = 'BackendError',
    this.method,
    Uri uri,
    this.body,
    this.code,
  }) : super(message, uri: uri);

  String toString() {
    var b = new StringBuffer()..write('BackendError: ')..write(message);
    if (method != null) {
      b.write(', method = $method');
    }
    if (uri != null) {
      b.write(', uri = $uri');
    }
    if (body != null) {
      b.write(', body = $body');
    }
    return b.toString();
  }
}
