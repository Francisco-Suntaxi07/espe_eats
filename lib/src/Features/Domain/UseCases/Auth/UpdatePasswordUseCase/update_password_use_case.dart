import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/Auth/UpdatePassword/update_password_repository.dart';

abstract class UpdatePasswordUseCase{
  Future<void> execute({required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase{

  //Dependencies
  //Se hace final por recomendacion
  final UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase({ UpdatePasswordRepository? updatePasswordRepository})
      : _updatePasswordRepository = updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({required String email}) {
    return _updatePasswordRepository.updatePassword(email: email);
  }
  
}