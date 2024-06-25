import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/error_messages.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/SignInRepository/sign_in_body_parameters.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/SignInRepository/sign_in_repository.dart';
import 'package:espeats/src/Features/Domain/Entities/Auth/SignInEntity//sign_in_entity.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'sign_in_use_case_parameters.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseParameters params});
}

class DefaultSignInUseCase extends SignInUseCase {
  // * Dependencies
  final SignInRepository _signInRepository;

  DefaultSignInUseCase({SignInRepository? signInRepository})
      : _signInRepository = signInRepository ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseParameters params}) {
    return _signInRepository
        .signIn(
            params: SignInBodyParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          // Null Check
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(SignInEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
