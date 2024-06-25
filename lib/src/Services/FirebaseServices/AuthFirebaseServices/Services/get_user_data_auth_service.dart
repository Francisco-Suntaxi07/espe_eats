import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';

class DefaultGetUserAuthDataService extends GetUserAuthDataService {

  @override
  Future<Map<String, dynamic>> getUserAuthData({required Map<String, dynamic> bodyparameters}) {
      return apiService.getDataFromPostRequest(bodyParameters: bodyparameters, url: endpoint);
    }

}