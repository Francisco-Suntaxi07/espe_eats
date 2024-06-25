
import 'package:espeats/src/Base/Constants/local_storage_keys.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/local_storage_use_case_parameters.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/RemoveLocalStorage/remove_local_storage_use_case.dart';

abstract class SignOutUseCase{
  Future<void> execute();
}

class DefaultSignOutUseCase extends SignOutUseCase{

  //Dependencies
  final DefaultRemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaultSignOutUseCase({DefaultRemoveLocalStorageUseCase? removeLocalStorageUseCase})
    : _removeLocalStorageUseCase = removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    return _removeLocalStorageUseCase.execute(params: RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }

}