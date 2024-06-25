import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:flutter/material.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/TextFormFields/custom_text_form_field.dart';
import 'package:espeats/src/Features/Presentation/SignUpPage/ViewModel/sign_up_view_model.dart';
import 'package:provider/provider.dart';
import 'package:espeats/src/Base/Views/base_view.dart';
//Widgets
import 'package:espeats/src/Features/Presentation/CommonWidgets/back_button.dart';


class SignUpPage extends StatelessWidget with BaseView {

  final SignUpViewModel _viewModel;

  SignUpPage({super.key, SignUpViewModel? viewModel}):
  _viewModel = viewModel ?? DefaultSignUpViewModel();

  @override
  Widget build(BuildContext context) {

    _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return _viewModel.loadingState.isLoading ? loadingView : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder( builder: (BuildContext context){
          return backButton(context, Colors.black);
        }),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            Center(
              child: Form(
                key: _viewModel.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child:  Column(
                    children: [
                      Text("Crear una cuenta", style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 20),
                      CustomTextFormField(delegate: _viewModel,
                          textFormFieldType: CustomTextFormFieldType.username,
                          hintext: "Nombre de usuario"),
                      CustomTextFormField(delegate: _viewModel,
                          textFormFieldType: CustomTextFormFieldType.email,
                          hintext: "Correo electrónico"),
                      CustomTextFormField(delegate: _viewModel,
                          textFormFieldType: CustomTextFormFieldType.phone,
                          hintext: "Celular"),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: CustomTextFormField(delegate: _viewModel,
                              textFormFieldType: CustomTextFormFieldType.dateOfBirth,
                              hintext: "Fecha de nacimiento",
                              controller: _viewModel.dateController)
                        )
                      ),
                      CustomTextFormField(delegate: _viewModel,
                          textFormFieldType: CustomTextFormFieldType.password,
                          hintext: "Contraseña"),
                      _signUpButton(context),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                        child: const Text("Al hacer clic en Registrarse, "
                            "acepta los siguientes Términos y condiciones",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0 )),
                      )
                    ],
                  ),
                ),
              )
            ) ,
          ]))
        ],
      )
    );
  }

  Widget _signUpButton( BuildContext context){
    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: ElevatedButton(//poner color del theme
            onPressed: () => _ctaTapped(context),
            child: Text("Registrarse", style: Theme.of(context).textTheme.titleSmall)
        )
    );
  }
}

extension UserActions on SignUpPage {
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: _viewModel.selectedDate,
        firstDate: DateTime(1960,1),
        lastDate: DateTime(2100),
        locale: const Locale('es',''));
    if(picked != null && picked != _viewModel.selectedDate){
      _viewModel.signUpModel?.date = "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
      _viewModel.dateController.text = "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }
  }
  void _ctaTapped (BuildContext context){
    if(_viewModel.isFormValidate()){
      _viewModel.signUp().then( (result) {
        switch (result.status){
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


