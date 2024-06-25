import 'package:espeats/src/Base/Views/base_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/error_state_provider.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Routes/routes.dart';


void main() {
  runApp( const AppState());
}


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
      ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
    ],
        child: MyAppUserState()
    );
  }
}

class MyAppUserState extends StatelessWidget with BaseView{
   MyAppUserState({super.key});

  @override
  Widget build(BuildContext context){
    return FutureBuilder( future: coordinator.start(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return MyApp(initialRoute: snapshot.data);
          } else{
            return const CircularProgressIndicator();
          }
        });
  }
}

class MyApp extends StatelessWidget {

  final String _initialRoute;
  const MyApp({super.key,  required String initialRoute}) : _initialRoute = initialRoute;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'ESPEATS',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
        // Spanish, no country codess
      ],
      theme: ThemeData(
          textTheme: const TextTheme(
            displaySmall: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            headlineSmall: TextStyle( //Para titulos principales
                color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30.0),
            titleLarge: TextStyle(  //Para subtitulos
                color: Colors.black, fontWeight: FontWeight.bold),
            titleSmall: TextStyle( //Para texto de botones
                color: Colors.white,fontSize: 17.0,  fontWeight: FontWeight.bold ),
            bodySmall: TextStyle( //Para descripciones de las cards de comida
                color: Color.fromRGBO(163, 155, 155, 1.0),fontWeight: FontWeight.w500,fontSize: 13.0),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(350.0,50.0)),
                  backgroundColor: MaterialStateColor.resolveWith((states) => const Color.fromRGBO(41,136,188, 1)),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ))
              )
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                  color: Colors.black)
          )
        //primaryColor: const Color.fromRGBO(10, 31, 68, 1.0),
        //colorScheme: ColorScheme.fromSeed(seedColor:Colors.deepOrange),
      ),
    );
  }
}
