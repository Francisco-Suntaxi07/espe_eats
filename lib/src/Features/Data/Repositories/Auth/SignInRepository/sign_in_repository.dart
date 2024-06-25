import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/sign_in_decodable.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Services/sign_in_auth_service.dart';
import 'sign_in_body_parameters.dart';

class DefaultSignInRepository extends SignInRepository {

  // * Dependencies
  final SignInService _signInService;

  DefaultSignInRepository({ SignInService? signInService }) : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn({ required SignInBodyParameters params }) async {
    try {
      final result = await _signInService.signIn(bodyParameters: params.toMap());
      return Result.success(SignInDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
