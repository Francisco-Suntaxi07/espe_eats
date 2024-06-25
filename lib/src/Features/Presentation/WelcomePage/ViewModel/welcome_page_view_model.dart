import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Views/base_view.dart';
import 'package:espeats/src/Features/Domain/Entities/User/user_entity.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/GoogleSignInUseCase/google_sign_in_use_case.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';

abstract class WelcomePageViewMOdelInput{
  Future<Result<UserEntity,Failure>> signInWithGoogle();
}

abstract class WelcomePageViewModel extends WelcomePageViewMOdelInput with BaseViewModel{}

class DefaultWelcomePageViewModel extends WelcomePageViewModel{

  //Dependencies
  final GoogleSignInUseCase _googleSignInUseCase;

  DefaultWelcomePageViewModel({GoogleSignInUseCase? googleSignInUseCase})
    : _googleSignInUseCase = googleSignInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  Future<Result<UserEntity, Failure>> signInWithGoogle() {
    return _googleSignInUseCase.execute();
  }
  
}