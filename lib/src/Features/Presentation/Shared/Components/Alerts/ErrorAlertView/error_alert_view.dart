import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/rounded_button.dart';

class ErrorAlertView {

  static Future showErrorAlertDialog({ 
    required BuildContext context, 
    required String subTitle, 
    dynamic Function()? ctaButtonAction }) async {

      await showDialog(context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: SizedBox(
                height: 320,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/icons/errorIcon.png'),
                      width: 130,
                      height: 130,
                    ),
                    Container(
                        margin: const EdgeInsets.all(15.0),
                        child: const Text("Error de red", style:  TextStyle(
                          color: primaryColor,
                          fontSize: 20.0
                        ))
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(subTitle,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0)),
                    ),
                    createElevatedButton(
                        color: orange,
                        labelButton: 'Ir a Inicio',
                        shape: const StadiumBorder(),
                        func: ctaButtonAction
                    )
                  ],
                ),
              ),
            );
          });
  }
}

