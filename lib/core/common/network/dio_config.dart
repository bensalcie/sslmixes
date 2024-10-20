import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../error/exceptions.dart';

@lazySingleton
class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json'};
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        responseBody: false,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: false,
      ));
    }
  }
  Future get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            if (e.response?.statusCode == 401) {
              // If a 401 response is received, refresh the access token
              //String newAccessToken = await refreshToken();

              // Update the request header with the new access token
              //e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              // Repeat the request with the updated header
              //return handler.resolve(await dio.fetch(e.requestOptions));
            }
            return handler.next(e);
          },
        ),
      );

      // SSL Pinning
      _dio.httpClientAdapter = await _createHttpClientAdapter();
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        data: queryParameters,
        // options: Options(headers: {'Authorization': appToken}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data.');
    } catch (e) {
      if (e.toString().contains('CERTIFICATE_VERIFY_FAILED')) {
        throw HandShakeException(
            errorMesageHandshake: 'CERTIFICATE_VERIFY_FAILED');
      }
      throw ServerException(errorMesage: e.toString());
    }
  }

  //SSL PINNING ADDITIONS.

  Future<HttpClientAdapter> _createHttpClientAdapter() async {
    final List<int> certBytes =
        await _loadPemCertificate('assets/ssl/mixes.pem');

    return IOHttpClientAdapter(
      createHttpClient: () {
        SecurityContext sc = SecurityContext();
        try {
          // Load the PEM certificate
          sc.setTrustedCertificatesBytes(certBytes);
        } catch (e) {
          if (kDebugMode) {
            print("Error loading PEM certificate: $e");
          }
          rethrow;
        }
        return HttpClient(context: sc);
      },
    );
  }

  // Helper to load the PEM certificate asynchronously from assets
  Future<List<int>> _loadPemCertificate(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }
}
