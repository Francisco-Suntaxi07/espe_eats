import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/LocalStorage/save_local_storage_repository.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/local_storage_use_case_parameters.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({ required SaveLocalStorageParameters saveLocalParameteres });
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {
  
  // * Dependencies
  final SaveLocalStorageRepository _saveLocalStorageRepository;

  DefaultSaveLocalStorageUseCase({ SaveLocalStorageRepository? saveLocalStorageRepository})
      : _saveLocalStorageRepository = saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository();

  @override
  Future<void> execute({ required SaveLocalStorageParameters saveLocalParameteres }) async {
    _saveLocalStorageRepository.saveInLocalStorage(key: saveLocalParameteres.key,
                                                   value: saveLocalParameteres.value);
  }

}
