import 'dart:io';

class HerokuApiError extends HttpException {
  final int code;
  final String method;
  final String body;

  HerokuApiError({
    String message = 'Heroku APi Error',
    this.method,
    Uri uri,
    this.body,
    this.code,
  }) : super(message, uri: uri);

  String toString() {
    var b = new StringBuffer()..write('OmdbAPiError: ')..write(message);
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
