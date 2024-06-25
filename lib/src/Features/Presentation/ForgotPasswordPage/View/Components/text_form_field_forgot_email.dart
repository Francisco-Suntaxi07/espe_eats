import 'package:espeats/src/Features/Presentation/ForgotPasswordPage/ViewModel/forgot_password_view_model.dart';
import 'package:espeats/src/Utils/Helpers/Validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';

class TextFormFieldEmailUpdatePassword extends StatelessWidget {
  final ForgotPasswordViewModel viewModel;
  const TextFormFieldEmailUpdatePassword({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: bgInputs,
        borderRadius: BorderRadius.circular(40)
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: "Ingresa tu correo electrónico",
          border: OutlineInputBorder(borderSide: BorderSide.none)
        ),
        validator: (value) => EmailFormValidator.validateEmail(email: value ?? ""),
        onChanged: (newValue) => viewModel.email = newValue
      ),
    );
  }
}
