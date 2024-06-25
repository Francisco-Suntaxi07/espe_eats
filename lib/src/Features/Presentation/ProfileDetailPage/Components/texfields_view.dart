import 'package:espeats/src/Utils/Extensions/screen_size.dart';
import 'package:flutter/material.dart';

class TextFieldsProfileDetailView extends StatelessWidget {
  //const TextFieldsProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createTextFieldUsername(context),
        _createTextFieldEmail(context),
        _createTextFieldPhone(context),
        _createTextFieldBirth(context),
        _createTextDirection(context)
      ],
    );
  }
}

Widget _createTextFieldUsername(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: 'Nombre de usuario',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextFieldEmail(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextFieldPhone(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Celular',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextFieldBirth(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
            hintText: 'Escriba su día de nacimiento',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextDirection(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.text,
        maxLines: 3,
        decoration: InputDecoration(
            hintText: 'Dirección',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}
