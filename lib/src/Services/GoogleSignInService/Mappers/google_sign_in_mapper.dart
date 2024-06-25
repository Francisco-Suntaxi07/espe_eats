import 'package:espeats/src/Services/GoogleSignInService/Entities/google_sign_in_user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInMapper{
  static GoogleSignUserEntity mapUserCredential(UserCredential credential, String idToken){
    return GoogleSignUserEntity(credential.user, idToken);
  }
}