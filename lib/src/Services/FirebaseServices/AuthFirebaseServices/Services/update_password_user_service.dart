import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/BodyParameters/update_password_user_service_body_parameters.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {

  final String _requestType = "PASSWORD_RESET";

  @override
  Future<Map<String,dynamic>> updatePassword({ required String email }) async {
    final params = UpdatePasswordBodyParameters(requestType: _requestType, email: email);
    return apiService.getDataFromPostRequest(bodyParameters: params.toMap(), url: endpoint);
  }
}