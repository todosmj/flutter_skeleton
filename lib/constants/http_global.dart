import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import '../injector.dart';
import 'context.dart';

class HttpGlobal {

  static final String _contentsTypeApplicationJson = 'application/json';

  final Map<String, String> _defaultHeaders = {HttpHeaders.contentTypeHeader: _contentsTypeApplicationJson, "deviceId" : "", "buildNum": Injector<Context>().buildNumber};
  // final Map<String, String> _defaultInternalHeaders = {HttpHeaders.contentTypeHeader: _contentsTypeApplicationJson, "accessToken" : SessionContext.accessToken, "deviceId" : SessionContext.deviceId, "buildNum": Context.buildNumber};
  // final Map<String, String> _defaultMultipartHeaders = {HttpHeaders.contentTypeHeader: 'multipart/form-data', "buildNum": Context.buildNumber};

  //external api
  Future<http.Response> get(String url, {Map<String, String> headers}) {
    return http.get(url, headers: _setSignHeader("GET", url, _defaultHeaders, headers));
  }

  Future<http.Response> post(String url, {Map<String, String> headers, dynamic body}) {
    return http.post(url, headers: _setSignHeader("POST", url, _defaultHeaders, headers), body: body);
  }

  Future<http.Response> put(String url, {Map<String, String> headers, dynamic body}) {
    return http.put(url, headers: _setSignHeader("PUT", url, _defaultHeaders, headers), body: body);
  }

  Future<http.Response> delete(String url, {Map<String, String> headers}) {
    return http.delete(url, headers: _setSignHeader("DELETE", url, _defaultHeaders, headers));

  }

  //Internal api
  // Future<http.Response> getInternal(String url, {Map<String, String> headers}) {
  //   return http.get(url, headers: _setSignHeader("GET", url, _defaultInternalHeaders, headers));
  // }
  //
  // Future<http.Response> postInternal(String url, {Map<String, String> headers, dynamic body, Encoding encoding}) {
  //   return http.post(url, headers: _setSignHeader("POST", url, _defaultInternalHeaders, headers), body: body);
  // }
  //
  // Future<http.Response> putInternal(String url, {Map<String, String> headers, dynamic body, Encoding encoding}) {
  //   return http.put(url, headers: _setSignHeader("PUT", url, _defaultInternalHeaders, headers), body: body);
  // }
  //
  // Future<http.Request> deleteInternal(String url, {Map<String, String> headers, dynamic body}) async {
  //   final uri = Uri.parse(url);
  //   final request = http.Request("DELETE", uri);
  //   request.headers.addAll(_setSignHeader("DELETE", url, _defaultInternalHeaders, headers));
  //   request.body = jsonEncode(body);
  //   return request;
  // }

  //multipartRequest
  // http.MultipartRequest multipartRequest(Uri uri, {Map<String, String> headers}) {
  //   http.MultipartRequest request = http.MultipartRequest('POST', uri);
  //   Map<String, String> header = _setSignHeader("POST", uri.path, _defaultMultipartHeaders, headers);
  //   request.headers.addAll(header);
  //   return request;
  // }

  //multipartRequest
  // http.MultipartRequest multipartInternalRequest(Uri uri, {Map<String, String> headers}) {
  //   http.MultipartRequest request = http.MultipartRequest('POST', uri);
  //   Map<String, String> header = _setSignHeader("POST", uri.path, _defaultMultipartHeaders, headers);
  //   request.headers.addAll({
  //     "accessToken" : SessionContext.accessToken,
  //     ...?header,
  //   });
  //   return request;
  // }

  //signHeader
  Map<String, String> _setSignHeader(String method, String url, Map<String, String> defaultHeader,  Map<String, String> header){
    String timestamp = (DateTime.now().millisecondsSinceEpoch ~/1000 ~/60).floor().toString();
    return {
      "bztimestamp" : timestamp,
      "bzsignature" : _getSignatureKey(method, Uri.parse(url).path, timestamp),
      ...? defaultHeader,
      ...? header,
    };
  }

  ///메시지 키 생성
  String _getSignatureKey(String method, String uri, String timestamp) {
    Context _context = Injector<Context>();
    var key = utf8.encode(_context.signingKey); /// signing key
    var signingKey = new Hmac(sha256, key);

    var bytes = utf8.encode('${method.toUpperCase()}_${uri}_${timestamp}');
    var digest = signingKey.convert(bytes);
    String signatureKey = base64.encode(digest.bytes);
    return signatureKey;
  }
}