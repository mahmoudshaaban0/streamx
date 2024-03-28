import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:streamx/core/networking/api_constants.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = ApiConstants.apiBaseUrl
        ..options.headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.token}'
        }
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      dio?.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll({});
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); //continue
        },
      ));

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
