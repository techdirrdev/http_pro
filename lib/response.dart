import 'dart:typed_data';
import 'package:http/http.dart';

class Response {
  int statusCode;
  String body;
  Uint8List bodyBytes;
  int? contentLength;
  Map<String, String> headers;
  bool isRedirect;
  bool persistentConnection;
  String? reasonPhrase;
  BaseRequest? request;

  Response(
      this.statusCode,
      this.body,
      this.bodyBytes,
      this.contentLength,
      this.headers,
      this.isRedirect,
      this.persistentConnection,
      this.reasonPhrase,
      this.request);
}
