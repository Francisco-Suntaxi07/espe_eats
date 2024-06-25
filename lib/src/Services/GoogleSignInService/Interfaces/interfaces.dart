import 'package:espeats/src/Services/GoogleSignInService/Entities/google_sign_in_user_entity.dart';

abstract class GoogleSignInService{
  Future<GoogleSignUserEntity> singInWithGoogle();
  Future<bool> isUserInDatabase({required String uid});
}