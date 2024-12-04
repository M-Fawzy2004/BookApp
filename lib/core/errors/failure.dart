import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With ApiService');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With ApiService');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With ApiService');

      case DioExceptionType.badCertificate:
        return ServerFailure('Certificate Timeout With ApiService');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Cancel Timeout With ApiService');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('Oop There Was An Error, Please Try Again Later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your Requset Was Not Found, Please Try Again');
    } else if (statusCode == 500) {
      return ServerFailure(
          'There Is A Problem With Server, Please Try Again Later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There Was An Error, Please Try Again');
    }
  }
}
