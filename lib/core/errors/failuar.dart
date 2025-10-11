import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Recive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Reques to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No Internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage:
              'Unknown error, something went wrong , please try again later',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: 'Method Not Found , please try again');
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal Server Error , please try again later',
      );
    } else {
      return ServerFailure(
        errorMessage: 'Oops, There is an error , please try again later',
      );
    }
  }
}
