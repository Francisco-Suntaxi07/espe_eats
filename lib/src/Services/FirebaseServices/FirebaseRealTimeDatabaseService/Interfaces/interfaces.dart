
abstract class BaseRealTimeDataBaseFirebase {
  String baseUrl = "https://espeats-default-rtdb.firebaseio.com/";
  String adminToken = "AIzaSyA-HDkQSS-hU6b8wPMpyzawXFN_XT-z8fw";
  String endUrl = ".json";
}

abstract class RealtimeDatabaseService extends BaseRealTimeDataBaseFirebase {
  Future<Map<String, dynamic>> postData({ required Map<String, dynamic> bodyParameters, required String path });
  Future<Map<String, dynamic>> putData({ required Map<String, dynamic> bodyParameters, required String path });
  Future<Map<String, dynamic>> getData({ required String path });
}
