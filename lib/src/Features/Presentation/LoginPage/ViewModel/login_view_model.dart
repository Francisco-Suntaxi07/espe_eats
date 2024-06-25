import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/local_storage_keys.dart';
import 'package:espeats/src/Base/Views/base_view.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/SignInUseCase/sign_in_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/SignInUseCase/sign_in_use_case_parameters.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/local_storage_use_case_parameters.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/SaveLocalStorage/save_local_storage_use_case.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/TextFormFields/custom_text_form_field.dart';
import 'package:espeats/src/Features/Presentation/LoginPage/Model/login_model.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginViewModelInput{
  // Exposed properties
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: "", password: "");

  // Exposed Methods
  Future<Result<bool, Failure>> login({ required String email, required String password});
  bool isFormValidate();
}

abstract class LoginViewModel extends LoginViewModelInput with BaseViewModel implements TextFormFieldDelegate{}

class DefaulLoginViewModel extends LoginViewModel{
  //Dependencies
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaulLoginViewModel({SignInUseCase? signInUseCase, SaveLocalStorageUseCase? saveLocalStorageUseCase})
  : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
    _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> login({required String email, required String password}) {
    loadingState.setLoadingState(isLoading: true);
    return _signInUseCase.execute(params: SignInUseCaseParameters(email: email,
                                                                  password: password)).then( (result){
      switch(result.status) {
        case ResultStatus.success:
          loadingState.setLoadingState(isLoading: false);
          _saveLocalStorageUseCase.execute( saveLocalParameteres: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? ""));
          return Result.success(true);
        case ResultStatus.error:
          loadingState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  @override
  onChanged({required String newValue, required CustomTextFormFieldType customTextFormFieldType}) {
    switch(customTextFormFieldType){
      case CustomTextFormFieldType.email:
        loginModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
      // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.phone:
      // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.dateOfBirth:
      // TODO: Handle this case.
        break;
    }
  }
  
}