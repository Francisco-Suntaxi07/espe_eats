import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/error_messages.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/User/save_user_data_repository.dart';
import 'package:espeats/src/Features/Data/Repositories/User/user_body_parameters.dart';
import 'package:espeats/src/Features/Domain/Entities/User/user_entity.dart';
import 'save_user_data_use_case_parameters.dart';


abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params });
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {

  // * Dependencies
  final SaveUserDataRepository _saveUserDataRepository;
    
  DefaultSaveUserDataUseCase({ SaveUserDataRepository? saveUserDataRepository }) 
               : _saveUserDataRepository = saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params }) {

    UserBodyParameters _parameters = UserBodyParameters(
        localId: params.localId,
        role: params.role?.toShortString(),
        username: params.username,
        email: params.email,
        phone: params.phone,
        dateOfBirth: params.dateOfBirth,
        startDate: params.startDate,
        photo: params.photo,
        shippingAddress: params.shippingAddress,
        billingAddress: params.billingAddress,
        idToken: params.idToken,
        provider: params.provider
    );

    return _saveUserDataRepository.saveUserData(parameters: _parameters).then((result) {
              switch (result.status) {
                case ResultStatus.success:
                  if(result.value == null) {
                    return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
                  }
                  return Result.success(UserEntity.fromMap(result.value!.toMap()));
                case ResultStatus.error:
                  return Result.failure(result.error);
              }
        });
  }
}
