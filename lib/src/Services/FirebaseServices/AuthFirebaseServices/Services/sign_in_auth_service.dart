import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';

class DefaultSignInService extends SignInService{
  @override
  Future<Map<String, dynamic>> signIn({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }

}