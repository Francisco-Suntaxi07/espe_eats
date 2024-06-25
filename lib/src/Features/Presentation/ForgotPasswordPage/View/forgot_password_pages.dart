import 'package:espeats/src/Features/Presentation/ForgotPasswordPage/View/Components/text_form_field_forgot_email.dart';
import 'package:espeats/src/Features/Presentation/ForgotPasswordPage/ViewModel/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/back_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //Dependencies
  final ForgotPasswordViewModel _viewModel;

  _ForgotPasswordState({ForgotPasswordViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text("¿Has olvidado tu contraseña?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    "Por favor ingrese su correo electrónico. "
                    "Recibirá un enlace para crear una nueva contraseña.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              TextFormFieldEmailUpdatePassword(viewModel: _viewModel),
              _sendButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _sendButton(BuildContext context) {
    return Container(
        width: 350.0,
        height: 50.0,
        margin: const EdgeInsets.only(top: 40.0),
        child: ElevatedButton(
          //poner color del theme
          onPressed: () {
            _ctaButtonTapped(context);
          },
          child: Text("Enviar", style: Theme.of(context).textTheme.titleSmall),
        ));
  }
}

extension UserActions on _ForgotPasswordState {
  void _ctaButtonTapped(BuildContext context) {
    _viewModel.updatePassword().then((value) => {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  content: SizedBox(
                    height: 380.0,
                    child: Column(
                      children: [
                        const Image(
                          width: 130.0,
                          height: 130.0,
                          image: AssetImage('assets/icons/send.png'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Tu contraseña ha sido restablecida.",
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text(
                              "En breve recibirá un correo electrónico con un código para configurar una nueva contraseña.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0)),
                        ),
                        _doneButton(context)
                      ],
                    ),
                  ),
                );
              })
        });
  }
}

Widget _doneButton(BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(top: 40.0),
      child: ElevatedButton(
        //poner color del theme
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
        child:
            Text("¡Está hecho!", style: Theme.of(context).textTheme.titleSmall),
      ));
}
