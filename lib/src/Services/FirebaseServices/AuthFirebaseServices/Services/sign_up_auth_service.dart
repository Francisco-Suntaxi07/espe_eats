import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';

class DefaultSignUpService extends SignUpService{
  @override
  Future<Map<String, dynamic>> signUp({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }
  
}