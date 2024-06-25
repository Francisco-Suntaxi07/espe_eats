import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/error_messages.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/UserAuthData/GetUserDataRepositoryParameters.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/UserAuthData/user_auth_data_repository.dart';
import 'package:espeats/src/Features/Domain/Entities/Auth/UserAuthData/user_auth_data_entity.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/UserAuthData/user_auth_data_use_case_body_parameters.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';

abstract class UserAuthDataUseCase{
  Future<Result<UserAuthDataEntity,Failure>>execute({required GetUserDataUseCaseBodyParameters parameters});
}

class DefaultUserAuthDataUseCase extends UserAuthDataUseCase{

  //Dependecies
  final UserAuthDataRespository _userAuthDataRespository;

  DefaultUserAuthDataUseCase({UserAuthDataRespository? userAuthDataRespository})
  : _userAuthDataRespository = userAuthDataRespository ?? DefaultUserAuthDataRespository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute({required GetUserDataUseCaseBodyParameters parameters}) {
    return _userAuthDataRespository.getUserAuthData(parameters: GetUserDataBodyParameters(idToken: parameters.idToken)).then((result){
      switch (result.status){
        case ResultStatus.success:
          if(result.value == null){
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserAuthDataEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

}