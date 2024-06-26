import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignUserEntity{
  String? displayName;
  String? email;
  bool? emailVerified;
  bool? isAnonymous;
  String? phoneNumber;
  String? photoURL;
  String? refreshToken;
  String? tenantID;
  String? uid;
  String? idToken;

  GoogleSignUserEntity(User? user, String? token){
    displayName = user?.displayName;
    email = user?.email;
    emailVerified = user?.emailVerified;
    isAnonymous = user?.isAnonymous;
    phoneNumber = user?.phoneNumber;
    photoURL = user?.photoURL;
    refreshToken = user?.refreshToken;
    tenantID = user?.tenantId;
    uid = user?.uid;
    idToken = token;
  }
}