import 'package:espeats/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/interfaces.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/realtime_database_service.dart';
import 'package:espeats/src/Services/GoogleSignInService/Entities/google_sign_in_user_entity.dart';
import 'package:espeats/src/Services/GoogleSignInService/Interfaces/interfaces.dart';
import 'package:espeats/src/Services/GoogleSignInService/Mappers/google_sign_in_mapper.dart';


class DefaultGoogleSignInService extends GoogleSignInService{

  final String _path = 'users/';

  //Dependencies
  final RealtimeDatabaseService _realTimeDataBaseService;

  DefaultGoogleSignInService({RealtimeDatabaseService? realTimeDataBaseService})
    : _realTimeDataBaseService = realTimeDataBaseService ?? DefaultRealtimeDatabaseServices();

  @override
  Future<bool> isUserInDatabase({required String uid}) async {
    final fullPath = _path + uid;
    try{
      final result = await _realTimeDataBaseService.getData(path: fullPath);
      return result.isNotEmpty;
    } on Failure catch (f){
      return false;
    }
  }

  @override
  Future<GoogleSignUserEntity> singInWithGoogle() async{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    
    return GoogleSignInMapper.mapUserCredential(userCredential, googleAuth?.idToken ?? "");

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

}