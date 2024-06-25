import 'package:espeats/src/Features/Presentation/CommonWidgets/TextFormFields/custom_text_form_field.dart';
import 'package:espeats/src/Features/Presentation/LoginPage/ViewModel/login_view_model.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:espeats/src/Base/Views/base_view.dart';

//Widgets
import 'package:espeats/src/Features/Presentation/CommonWidgets/back_button.dart';

//Colors
import 'package:espeats/src/Colors/colors.dart';


class  LoginPage extends StatelessWidget with BaseView {
  //dependencies
  final LoginViewModel _viewModel;

  LoginPage({super.key, LoginViewModel? viewModel}) : _viewModel = viewModel ?? DefaulLoginViewModel();


  @override
  Widget build(BuildContext context) {
    //Inicializar view model
    _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return _viewModel.loadingState.isLoading ? loadingView : Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            Column(
              children: [
                Stack(
                  children: [
                     Container(
                       margin: const EdgeInsets.only(top: 20),
                       child: const Image(
                        width: double.infinity,
                        height: 350.0,
                        //fit: BoxFit.cover,
                        image: AssetImage('assets/images/logo.jpeg'),
                    ),
                     ),
                    Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      child: backButton(context, Colors.black),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: const Offset(0.0,-20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Form(
                          key: _viewModel.formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Text("Bienvenido",style: Theme.of(context).textTheme.headlineSmall),
                              const Text("Ingrese a su cuenta", style: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0 )),
                              CustomTextFormField(delegate: _viewModel,
                                  textFormFieldType: CustomTextFormFieldType.email,
                                  hintext: "Correo Electrónico"),
                              CustomTextFormField(delegate: _viewModel,
                                  textFormFieldType: CustomTextFormFieldType.password,
                                  hintext: "Contraseña"),
                              _loginButton(context),
                              Container(
                                margin: const EdgeInsets.only(top: 30.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, 'forgot_password');
                                  },
                                  child: const Text("¿Olvidaste tu contraseña?", style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.0
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ])
          )
        ],
      )
    );
  }

  Widget _loginButton( BuildContext context){
    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: ElevatedButton(
            onPressed: () => _ctaButtonTapped(context),
            child: Text("Iniciar Sesión", style: Theme.of(context).textTheme.titleSmall)
        )
    );
  }
}



extension UserActions on LoginPage{
  void _ctaButtonTapped(BuildContext context){
    if(_viewModel.isFormValidate()){
      _viewModel.login(email: _viewModel.loginModel?.email ?? "",
          password: _viewModel.loginModel?.password ?? "").then( (result) {
        switch(result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, 'tabs');
            break;
          case ResultStatus.error:
            errorStateProvider.setFailure(context: context, value: result.error!);
            break;
        }
      });
    }
  }
}
