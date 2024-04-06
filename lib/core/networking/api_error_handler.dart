import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forBidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  // API_LOGIC_ERROR,
  defaultLogic
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int apiLogicError = 422; // API , lOGIC ERROR

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultStatusCode = -7;
}

class ResponseMessage {
  static const String success = ApiErrors.success; // success with data
  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)
  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String unauthorised =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String forbidden =
      ApiErrors.forbiddenError; //  failure, API rejected request
  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String connectTimeout = ApiErrors.timeoutError;
  static String cancel = ApiErrors.defaultError;
  static String recieveTimeout = ApiErrors.timeoutError;
  static String sendTimeout = ApiErrors.timeoutError;
  static String cacheError = ApiErrors.cacheError;
  static String noInternetConnection = ApiErrors.noInternetError;
  static String defaultLocalStatusCode = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  FailureError getFailure() {
    switch (this) {
      case DataSource.success:
        return FailureError(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return FailureError(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return FailureError(
            ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forBidden:
        return FailureError(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return FailureError(
            ResponseCode.unauthorized, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return FailureError(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return FailureError(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeOut:
        return FailureError(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return FailureError(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeOut:
        return FailureError(
            ResponseCode.receiveTimeout, ResponseMessage.recieveTimeout);
      case DataSource.sendTimeOut:
        return FailureError(
            ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return FailureError(
            ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return FailureError(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultLogic:
        return FailureError(ResponseCode.defaultStatusCode,
            ResponseMessage.defaultLocalStatusCode);
    }
  }
}

class ErrorHandler implements Exception {
  late FailureError failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultLogic.getFailure();
    }
  }
}

FailureError _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return FailureError(error.response?.statusCode ?? 0,
            error.response?.data["message"] ?? "");
      } else {
        return DataSource.defaultLogic.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    default:
      return DataSource.defaultLogic.getFailure();
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
