import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:espeats/src/Features/Data/Repositories/LocalStorage/fetch_local_storage_repository.dart';
import 'local_storage_use_case_parameters.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute({ required FetchLocalStorageParameters fetchLocalParameters });
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {

  // * Dependencies
  final FetchLocalStorageRepository _fetchLocalStorageRepository;
  
  DefaultFetchLocalStorageUseCase({ FetchLocalStorageRepository? fetchLocalStorageRepository })
      : _fetchLocalStorageRepository = fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute({ required FetchLocalStorageParameters fetchLocalParameters }) async {
    return await _fetchLocalStorageRepository.fetchInLocalStorage(key: fetchLocalParameters.key);
  }

}
