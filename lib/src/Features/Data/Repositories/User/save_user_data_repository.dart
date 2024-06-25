import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Features/Data/Decodables/User/user_decodable.dart';
import 'package:espeats/src/Features/Data/Repositories/User/user_body_parameters.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import '../../../../Base/Constants/error_messages.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/interfaces.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/realtime_database_service.dart';
import '../../Interfaces/interfaces.dart';

abstract class _Paths {
  //static String userCollection = "usuario/";
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository{
  // * Dependencies
  final RealtimeDatabaseService _realtimeDataBaseService;

  DefaultSaveUserDataRepository({ RealtimeDatabaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseServices();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters}) async{
    if (parameters.localId == null) {
      return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
    }
    //Creamos el path
    var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _realtimeDataBaseService.putData(bodyParameters: parameters.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }

 
  

}

