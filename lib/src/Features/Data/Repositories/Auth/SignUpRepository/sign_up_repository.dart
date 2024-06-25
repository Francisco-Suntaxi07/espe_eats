import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/sign_up_decodable.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Services/sign_up_auth_service.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';

import 'sign_up_body_parameters.dart';

class DefaultSignUpRepository extends SignUpRepository {
  // * Dependencies
  final SignUpService _signUpService;

  DefaultSignUpRepository({SignUpService? signUpService})
      : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpRepositoryParameters params}) async {
    try {
      final result =
          await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
