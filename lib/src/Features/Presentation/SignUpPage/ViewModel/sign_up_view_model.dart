import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Base/Constants/local_storage_keys.dart';
import 'package:espeats/src/Base/Views/base_view.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/SignUpUseCase/sign_up_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/Auth/SignUpUseCase/sign_up_use_case_parameters.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/local_storage_use_case_parameters.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/SaveLocalStorage/save_local_storage_use_case.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/TextFormFields/custom_text_form_field.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Features/Presentation/SignUpPage/Model/sign_up_model.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:flutter/cupertino.dart';

abstract class SignUpViewModelInput{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;
  SignUpModel? signUpModel = SignUpModel();


  Future<Result<bool,Failure>> signUp();
  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput  with BaseViewModel implements TextFormFieldDelegate{
}

class DefaultSignUpViewModel extends SignUpViewModel{
  //Dependencies
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel({SignUpUseCase? signUpUseCase,
    SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> signUp() {
    loadingState.setLoadingState(isLoading: true);

    return _signUpUseCase.execute(params: SignUpUseCaseParameters(
        username: signUpModel?.username ?? "",
        email: signUpModel?.email ?? "",
        password: signUpModel?.password ?? "",
        date: signUpModel?.date ?? "")).then( (result) {
          switch(result.status){
            case ResultStatus.success:
              _saveLocalStorageUseCase.execute(saveLocalParameteres: SaveLocalStorageParameters(
                                                                                               key: LocalStorageKeys.idToken,
                                                                                                value: result.value?.idToken ?? ""));
              loadingState.setLoadingState(isLoading: false);
              return Result.success(true);
            case ResultStatus.error:
              loadingState.setLoadingState(isLoading: false);
              return Result.failure(result.error);
          }
    });
  }

  @override
  onChanged({required String newValue, required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        signUpModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;
      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;
      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break;
      default:
        break;
    }
  }
}