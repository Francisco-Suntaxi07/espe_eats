
import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/LocalStorage/remove_local_storage_repository.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/local_storage_use_case_parameters.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({required RemoveLocalStorageParameters params});
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {

  // * Dependencies
  final RemoveLocalStorageRepository _defaultRemoveLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase({ RemoveLocalStorageRepository? defaultRemoveLocalStorageRepository })
      : _defaultRemoveLocalStorageRepository = defaultRemoveLocalStorageRepository ?? DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute({required RemoveLocalStorageParameters params}) async {
    return _defaultRemoveLocalStorageRepository.removeInLocalStorage(
        key: params.key);
  }
}
