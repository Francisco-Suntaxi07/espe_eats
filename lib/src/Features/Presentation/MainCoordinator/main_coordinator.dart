import 'package:flutter/material.dart';
import 'package:espeats/src/Base/Constants/local_storage_keys.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/fetch_local_storage_use_case.dart';
import 'package:espeats/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/local_storage_use_case_parameters.dart';
import 'package:espeats/src/Features/Domain/UseCases/User/ValidateCurrentUserUseCase/validate_current_user_use_case.dart';


class RoutesPath{
  static String welcomePath = "welcome";
  static String tabsPath = "tabs";

}

class MainCoordinator{
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserCase;

  MainCoordinator({ FetchLocalStorageUseCase? fetchLocalStorageUseCase,
                    ValidateCurrentUserUseCase? validateCurrentUserUseCase})
      : _fetchLocalStorageUseCase = fetchLocalStorageUseCase?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase = validateCurrentUserUseCase ?? DefaultValidateCurrentUserUseCase();

  Future <String?> start(){
    return _isUserLogged().then( (value) {
      return value == null ? RoutesPath.welcomePath : RoutesPath.tabsPath;
    });
  }

  Future <String?> _isUserLogged() async{
    var idToken = await _fetchLocalStorageUseCase.execute(fetchLocalParameters: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
    //revisar si el usuario esta guardado
    return idToken;
  }

  showTabsPage({required BuildContext context}){
    Navigator.pushNamed(context, RoutesPath.tabsPath);
  }

}
  //if(idToken == null){
  //return null;
  //}

//hay un token guardado, y vamos a comprobar que el usaurio exista aún en Firebase
 // var isUserValid = await _validateCurrentUserCase.execute(idToken: idToken);

  //if(isUserValid){
  //return idToken;
  //}else{
 // return null;
  //}
//
