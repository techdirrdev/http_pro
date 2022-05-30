import 'dart:convert';
import 'package:http/http.dart' as http_request;
import 'package:http_parser/http_parser.dart';
import 'package:http_pro/file_data.dart';

/// Sends an HTTP HEAD request with the given headers to the given URL.
Future<http_request.Response> head(String url,
    {Map<String, String>? headers}) async {
  return await http_request.get(Uri.parse(url), headers: headers);
}

/// Sends an HTTP GET request with the given headers to the given URL.
Future<http_request.Response> get(String url,
    {Map<String, String>? headers}) async {
  return await http_request.get(Uri.parse(url), headers: headers);
}

/// Sends an HTTP POST request with the given headers and body to the given URL.
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
Future<http_request.Response> post(String url,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  return await http_request.post(Uri.parse(url),
      headers: headers, body: body, encoding: encoding);
}

/// Sends an HTTP PUT request with the given headers and body to the given URL.
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
Future<http_request.Response> put(String url,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  return await http_request.post(Uri.parse(url),
      headers: headers, body: body, encoding: encoding);
}

/// Sends an HTTP PATCH request with the given headers and body to the given
/// URL.
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
Future<http_request.Response> patch(String url,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  return await http_request.post(Uri.parse(url),
      headers: headers, body: body, encoding: encoding);
}

/// Sends an HTTP DELETE request with the given headers to the given URL.
Future<http_request.Response> delete(String url,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  return await http_request.post(Uri.parse(url),
      headers: headers, body: body, encoding: encoding);
}

/// Sends an HTTP multipart request with the given headers or body or file to the given URL.
Future<http_request.Response> multipart(String url,
    {String method = 'POST',
    Map<String, String>? headers,
    Map<String, String>? body,
    String fileDataParam = 'file',
    List<FileData>? fileData}) async {
  var request = http_request.MultipartRequest(method, Uri.parse(url));

  if (headers != null) {
    request.headers.addAll(headers);
  }
  if (body != null) {
    request.fields.addAll(body);
  }

  if (fileData != null) {
    for (int i = 0; i < fileData.length; i++) {
      if (fileData[i].filePath.trim().isNotEmpty) {
        request.files.add(await http_request.MultipartFile.fromPath(
            '$fileDataParam[$i]', fileData[i].filePath,
            filename: fileData[i].fileName,
            contentType: MediaType.parse(fileData[i].fileMimeType)));
      }
    }
  }

  return await http_request.Response.fromStream(await request.send());
}
