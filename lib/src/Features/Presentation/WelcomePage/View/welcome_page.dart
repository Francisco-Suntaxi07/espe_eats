import 'package:espeats/src/Base/Views/base_view.dart';
import 'package:espeats/src/Utils/Helpers/ResultType/result_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Features/Presentation/WelcomePage/ViewModel/welcome_page_view_model.dart';
import 'dart:ui';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BaseView{

  final WelcomePageViewModel _viewModel;
  _WelcomePageState({WelcomePageViewModel? welcomePageViewModel})
    : _viewModel = welcomePageViewModel ?? DefaultWelcomePageViewModel();

  @override
  Widget build(BuildContext context) {

    _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background_image.png')
              )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.55),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text("¿Cansado de ir a clases sin comer porque no te alcanza el tiempo para comprar?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall)
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 30.0),
                child: const Text("ESPEATS es la solución", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                )),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text("Iniciar Sesión", style: Theme.of(context).textTheme.titleSmall),
                )
              ),
              Container(
                  width: 350.0,
                  height: 50.0,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white),
                      onPressed: (){_signInWithGoogleTapped(context);},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/icons/google_icon.png'),
                          width: 30.0,
                          height: 30.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: const Text("Conectar con Google", style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                          ))
                        )
                      ],
                    )
                  )
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿No tienes una cuenta?", style: TextStyle(
                          color: Color.fromRGBO(196, 196, 196, 1.0),
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0
                      )),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'sign_up');
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Text("Regístrate", style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          )),
                        ),
                      ),
                    ]
                ),
              )
            ],
          )
        ],
      )
    );
    }
}

extension UserActions on _WelcomePageState {
  _signInWithGoogleTapped(BuildContext context){
    _viewModel.loadingState.setLoadingState(isLoading: true);
    _viewModel.signInWithGoogle().then((result){
      switch(result.status){
        case ResultStatus.success:
          coordinator.showTabsPage(context: context);
          break;
        case ResultStatus.error:
          _viewModel.loadingState.setLoadingState(isLoading: true);
          if (result.error == null){return; }
          errorStateProvider.setFailure(context: context, value: result.error!);
          break;
      }
    });
  }

}

