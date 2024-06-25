import 'package:espeats/src/Colors/colors.dart';
import 'package:flutter/material.dart';


class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: orange,
            ),
            SizedBox(height: 10),
            Text("Cargando...")
          ],
        ),
      )
    );
  }
}
