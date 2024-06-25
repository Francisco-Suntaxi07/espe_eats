import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/error_messages.dart';
import 'package:espeats/src/Features/Domain/Entities/Auth/SignUpEntity/sign_up_entity.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/SignUpUseCase/sign_up_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/SignUpUseCase/sign_up_use_case_parameters.dart';
import 'package:espeats/src/Services/FirebaseServices/AuthFirebaseServices/Decodables/auth_error_decodable.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class _Constants{
  static String  correctEmail = "sfsuntaxi1@espe.edu.ec";
  static String  correctPassword = "123456";
  static String  wrongEmail = "sfsuntaxi1@espe.edu.ec";
  static String  wrongPassword = "1234567";
}

void main(){
  // GIVEN
  SignUpUseCase sut = DefaultSignUpUseCase();

  /*
  group('Test success SigUp user in Firebase',() {
    test('Test succes signUp user', () async {
      final SignUpUseCaseParameters params = SignUpUseCaseParameters(
          username: "Francisco",
          email: _Constants.correctEmail,
          password: _Constants.correctPassword,
          date: "08/02/2000",
          phone: "123456"
      );

      // WHEN
      final result = await sut.execute(params: params);

      switch (result.status){
        case ResultStatus.success:
          // THEN
          expect(result.value, isA<SignUpEntity>());
          break;
        case ResultStatus.error:
          // THEN
          expect(result.error, Failure);
          break;
      }
    });
  });
  */

  group('Test failure SigUp user in Firebase', () {
    test('Test failure SigUp user', () async {
      try{
        // WHEN
        final SignUpUseCaseParameters params = SignUpUseCaseParameters(
            username: "Francisco",
            email: _Constants.wrongEmail,
            password: _Constants.correctPassword,
            date: "08/02/2000",
            phone: "123456"
        );
        final _ = await sut.execute(params: params);
      }on Failure catch(f){
        //THEN
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        expect(_error.error!.message, FBFailureMessages.emailExistMessage);
      }
    });
  });

}