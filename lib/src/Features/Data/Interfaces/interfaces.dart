//Auth Repositories
import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Features/Data/Decodables/Auth/UserAuthData/user_auth_data_decodable.dart';
import 'package:espeats/src/Features/Data/Decodables/User/user_decodable.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/SignInRepository/sign_in_body_parameters.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/SignUpRepository/sign_up_body_parameters.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/UserAuthData/GetUserDataRepositoryParameters.dart';
import 'package:espeats/src/Features/Data/Repositories/User/user_body_parameters.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/sign_in_decodable.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/sign_up_decodable.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/update_password_decodable.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';


abstract class SignInRepository{
  Future<Result<SignInDecodable, Failure>> signIn({required SignInBodyParameters params});
}

abstract class SignUpRepository{
  Future<Result<SignUpDecodable, Failure>> signUp({required SignUpRepositoryParameters params});
}

abstract class UpdateEmailRepository {
  Future<dynamic> updateEmail({ required String oldEmail, required String newEmail, required String password });
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({ required String email});
}

abstract class UserAuthDataRespository {
  Future<Result<UserAuthDataDecodable,Failure>>getUserAuthData({ required GetUserDataBodyParameters parameters});
}

//User Database Repositories
abstract class SaveUserDataRepository{
  Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters});
}

abstract class GetAuthUserDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserData({ required GetUserDataBodyParameters params });
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId });
}

// * LocalStorage Repositories
abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({ required String key, required String value });
  //Future<void> saveRecentSearchInLocalStorage({ required String key, required List<String> value });
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({ required String key });
  //Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}
