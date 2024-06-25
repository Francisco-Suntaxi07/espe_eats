import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Features/Data/Decodables/Auth/UserAuthData/user_auth_data_decodable.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/UserAuthData/GetUserDataRepositoryParameters.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Interfaces/auth_firebase_infaces.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Services/get_user_data_auth_service.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';

class DefaultUserAuthDataRespository extends UserAuthDataRespository {

  //Dependencies
  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRespository({GetUserAuthDataService? getUserAuthDataService})
  :_getUserAuthDataService = getUserAuthDataService ?? DefaultGetUserAuthDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData({required GetUserDataBodyParameters parameters}) async {
    try{
      final result = await _getUserAuthDataService.getUserAuthData(bodyparameters: parameters.toMap());
      UserAuthDataDecodable _decodable = UserAuthDataDecodable.fromMap(result);
      return Result.success(_decodable);
    } on  Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }


}
