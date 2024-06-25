import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultFetchLocalStorageRepository extends FetchLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String?> fetchInLocalStorage({ required String key }) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }
}

