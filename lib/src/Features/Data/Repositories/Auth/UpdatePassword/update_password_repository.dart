import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/update_password_decodable.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Services/update_password_user_service.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository{

  //Dependencies
  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository({UpdatePasswordUserService? updatePasswordUserService})
      : _updatePasswordUserService = updatePasswordUserService ?? DefaultUpdatePasswordUserService();
  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({required String email}) async {
    try{
      final result = await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable _decodable = UpdatePasswordDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}