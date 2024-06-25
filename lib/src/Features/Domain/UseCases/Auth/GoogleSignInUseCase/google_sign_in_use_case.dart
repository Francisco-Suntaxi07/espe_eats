import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/local_storage_keys.dart';
import 'package:espeats/src/Features/Domain/Entities/User/user_entity.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/local_storage_use_case_parameters.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/SaveLocalStorage/save_local_storage_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/User/SaveUserDataUseCase/save_user_data_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/User/SaveUserDataUseCase/save_user_data_use_case_parameters.dart';
import 'package:espeats/src/Services/GoogleSignInService/Entities/google_sign_in_user_entity.dart';
import 'package:espeats/src/Services/GoogleSignInService/Interfaces/interfaces.dart';
import 'package:espeats/src/Services/GoogleSignInService/Services/google_sign_in_service.dart';
import 'package:espeats/src/Utils/Helpers/Dates/date_helpers.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';

abstract class GoogleSignInUseCase{
  Future<Result<UserEntity,Failure>> execute();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase{

  //dependencies
  final GoogleSignInService _googleSignInService;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultGoogleSignInUseCase({
    GoogleSignInService? googleSignInService,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
    SaveUserDataUseCase? saveUserDataUseCase
  }) : _googleSignInService = googleSignInService ?? DefaultGoogleSignInService(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(),
        _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<UserEntity, Failure>> execute() async {
    final user = await _googleSignInService.singInWithGoogle();
    _saveLocalStorageUseCase.execute(saveLocalParameteres: SaveLocalStorageParameters(key: LocalStorageKeys.idToken,
        value: user.uid ?? ""));

    final isUserInDatabase = await _googleSignInService.isUserInDatabase(uid: user.uid ?? "");
    if (isUserInDatabase) {
      return Result.success(_mapUserEntity(user:user));
    } else {
      return _saveUserDataInDataBase(user: user);
    }
  }
}

extension Mapper on DefaultGoogleSignInUseCase{
  UserEntity _mapUserEntity({required GoogleSignUserEntity user}){
    return UserEntity(
        localId: user.uid,
        role: UserRole.user.toShortString(),
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.idToken,
        provider: UserAuthProvider.google
    );
  }
}

extension PrivateMethods on DefaultGoogleSignInUseCase{
  Future<Result<UserEntity, Failure>> _saveUserDataInDataBase({required GoogleSignUserEntity user}){
    SaveUserDataUseCaseParameters params = SaveUserDataUseCaseParameters(
        localId: user.uid,
        role: UserRole.user,
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.idToken,
        provider: UserAuthProvider.google);
    return _saveUserDataUseCase.execute(params: params);
  }
}