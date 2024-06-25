import 'package:espeats/src/Features/Data/Interfaces/interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultRemoveLocalStorageRepository extends RemoveLocalStorageRepository {

  // * Dependencies
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future removeInLocalStorage({ required String key }) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }
}