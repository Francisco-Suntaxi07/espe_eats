import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';
import 'package:espeats/src/Utils/Helpers/Validators/form_validators.dart';

abstract class TextFormFieldDelegate {
  onChanged({required String newValue,
      required CustomTextFormFieldType customTextFormFieldType});
}

enum CustomTextFormFieldType { email, password, phone, username, dateOfBirth }

class CustomTextFormField extends StatelessWidget {
  //const CustomTextFormField({super.key});

  final CustomTextFormFieldType textFormFieldType;
  final String hintext;
  final TextFormFieldDelegate delegate;
  final TextEditingController? _controller;

  const CustomTextFormField({super.key,
    required this.delegate,
    required this.textFormFieldType,
    required this.hintext,
    TextEditingController? controller,
    Decoration? decoration,
    String? initialValue,
    Widget? icon})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: bgInputs,
        borderRadius: BorderRadius.circular(40)
      ),
      child:TextFormField(
        controller: _controller,
        keyboardType: getKeyboardType(textFormFieldType: textFormFieldType),
        obscureText: textFormFieldType == CustomTextFormFieldType.password ? true : false,
        decoration: InputDecoration(
          hintText: hintext,
          border: const OutlineInputBorder(borderSide: BorderSide.none)
        ),
        onChanged: (newValue) => delegate.onChanged(newValue: newValue, customTextFormFieldType: textFormFieldType),
        validator: (value){
          switch (textFormFieldType) {
            case CustomTextFormFieldType.email:
              return EmailFormValidator.validateEmail(email: value ?? '');
            case CustomTextFormFieldType.password:
              return PasswordFormValidator.validatePassword(password: value ?? '');
            case CustomTextFormFieldType.username:
              return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
            case CustomTextFormFieldType.phone:
              return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
            default:
              return null;
          }
        },
      )
    );
  }

  TextInputType? getKeyboardType({ required CustomTextFormFieldType textFormFieldType }) {
    switch (textFormFieldType) {
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.username:
        return TextInputType.text;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

}
