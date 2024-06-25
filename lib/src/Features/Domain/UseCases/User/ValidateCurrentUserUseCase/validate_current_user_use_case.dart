import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/UserAuthData/user_auth_data_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/UserAuthData/user_auth_data_use_case_body_parameters.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';

abstract class ValidateCurrentUserUseCase{
  Future<bool> execute ({required String idToken});
}

class DefaultValidateCurrentUserUseCase extends ValidateCurrentUserUseCase{
  final UserAuthDataUseCase _authDataUseCase;
  DefaultValidateCurrentUserUseCase ({UserAuthDataUseCase? authDataUseCase})
    :_authDataUseCase = authDataUseCase ?? DefaultUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async{
    try{
      return _authDataUseCase.execute(parameters: GetUserDataUseCaseBodyParameters(idToken: idToken)).then((result){
        switch (result.status){
          case ResultStatus.success:
            return true;
          case ResultStatus.error:
            return false;
        }
      });
    } on Failure{
      return false;
    }
  }


}