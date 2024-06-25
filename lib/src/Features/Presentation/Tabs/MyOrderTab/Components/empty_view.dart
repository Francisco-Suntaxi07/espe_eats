import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/Texts/TextView/text_view.dart';


class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: Colors.white,
        title: const TextView(
            texto: 'Mi Orden',
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                width: 216,
                height: 216,
                image: AssetImage('assets/images/emptyOrder.png')),
            Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: const Text("Carrito Vacío", style: TextStyle(color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500)),
            ),
            Container(
              margin:  const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: const Text("Buena comida, los mejores productos y más, los escuentras aquí.",
                  style: TextStyle(color: Colors.grey,
                      fontSize: 17,
                  fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
