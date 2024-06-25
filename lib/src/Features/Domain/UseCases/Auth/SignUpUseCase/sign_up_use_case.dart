import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/error_messages.dart';
import 'package:espeats/src/Utils/Helpers/Dates/date_helpers.dart';
import 'package:espeats/src/Utils/Helpers/DefaultImages/default_user_photo_helper.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/SignUpRepository/sign_up_repository.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/SignUpRepository/sign_up_body_parameters.dart';
import 'package:espeats/src/Features/Domain/Entities/Auth/SignUpEntity/sign_up_entity.dart';
import 'package:espeats/src/Features/Domain/Entities/User/user_entity.dart';
import 'package:espeats/src/Features/Domain/UseCases/User/SaveUserDataUseCase/save_user_data_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/User/SaveUserDataUseCase/save_user_data_use_case_parameters.dart';
import 'sign_up_use_case_parameters.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {

  // * Dependencies
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase({ SignUpRepository? signUpRepository,
    SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(params: SignUpRepositoryParameters(email: params.email,
        password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
        // Null Check
          if (result.value == null) {
            return Result.failure(
                Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          SignUpEntity entity = SignUpEntity.fromMap(result.value!.toMap());
          return saveUserDataInDataBase(params: params, entity: entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase({required SignUpUseCaseParameters params,
    required SignUpEntity entity }) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: entity.localId,
        role: UserRole.user,
        username: params.username,
        email: entity.email,
        phone: params.phone,
        dateOfBirth: params.date,
        startDate: DateHelpers.getStartDate(),
        photo: DefaultUserPhotoHelper.defaultUserPhoto,
        shippingAddress: '',
        billingAddress: '',
        idToken: entity.idToken,
        //provider: params.provider
    );

    return _saveUserDataUseCase.execute(params: _params).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
