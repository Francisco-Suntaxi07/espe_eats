import 'package:espeats/src/Base/ApiService/api_service.dart';
import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/interfaces.dart';

abstract class RealtimeDatabaseExceptions {
  static const String socketExceptionMessage = "No Internet connection 😑";
  static const String httpException = "Couldn't find the path 😱";
  static const String formatException = "Bad response format 👎";
}

class DefaultRealtimeDatabaseServices extends RealtimeDatabaseService {
  
  final ApiService _apiService;

  DefaultRealtimeDatabaseServices({ ApiService? apiService }) : _apiService = apiService ?? DefaultApiService();

  @override
  Future<Map<String, dynamic>> getData({ required String path }) async {
    var endpoint = baseUrl + path + endUrl;

    try {
      final result = await _apiService.getDataFromGetRequest(url: endpoint);
      return result;
    } on Failure catch (f) {
      switch (f.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return f.error;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> putData({ required Map<String, dynamic> bodyParameters,
                                         required String path }) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromPutRequest(bodyParameters: bodyParameters, url: endpoint);
      return result;
    } on Failure catch (f) {
      switch (f.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return f.error;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> postData({ required Map<String, dynamic> bodyParameters,
                                          required String path }) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
      return result;
    } on Failure catch (f) {
      switch (f.message) {
        case RealtimeDatabaseExceptions.httpException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.httpException));
        case RealtimeDatabaseExceptions.formatException:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.formatException));
        case RealtimeDatabaseExceptions.socketExceptionMessage:
          return Future.error(Failure.fromMessage(message: RealtimeDatabaseExceptions.socketExceptionMessage));
        default:
          return f.error;
      }
    }
  }
}
