
import 'package:espeats/src/Features/Domain/UseCases/Auth/UpdatePasswordUseCase/update_password_use_case.dart';

abstract class ForgotPasswordViewModelInput{
  late String email;
  Future<void> updatePassword();
}

abstract class ForgotPasswordViewModel extends ForgotPasswordViewModelInput{}

class DefaultForgotPasswordViewModel extends ForgotPasswordViewModel{

  //Dependencies
  final UpdatePasswordUseCase _updatePasswordUseCase;

  DefaultForgotPasswordViewModel({ UpdatePasswordUseCase? updatePasswordUseCase })
      : _updatePasswordUseCase = updatePasswordUseCase ?? DefaultUpdatePasswordUseCase();
  @override
  Future<void> updatePassword() {
    return _updatePasswordUseCase.execute(email: email);
  }

}