import 'package:espeats/src/Features/Presentation/CommonWidgets/rounded_button.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Features/Presentation/Tabs/ProfileTab/ViewModel/profile_tab_view_model.dart';
import 'package:espeats/src/Features/Presentation/WelcomePage/View/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  final ProfileTabViewModel _viewModel;
  _ProfileTabState({ProfileTabViewModel? viewModel})
    : _viewModel = viewModel ?? DefaultProfileTabViewModel();


  @override
  Widget build(BuildContext context) {

    _viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'profile-detail'),
                child: _header()),
            _contentProfile(context)
          ],
        ),
      ),
    );
  }
  Widget _header() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxWidth > 700 ? 250 : 200;
        return Container(
            height: height,
            color: bgGray,
            padding: const EdgeInsets.all(40),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyZmlsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
                  radius: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          const Text('Lusho Espinoza',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.chevron_right,
                                color: gray,
                              )),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        height: 20,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: pink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: Row(children: [
                            const Image(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/128/3916/3916808.png'),
                              width: 16,
                              height: 16,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const Text('VIP Member',
                                style:
                                TextStyle(fontSize: 11, color: Colors.white),
                              ),
                            )
                          ]),
                        ))
                  ],
                )
              ],
            ));
      },
    );
  }

  Widget _contentProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3916/3916808.png'),
            width: 29,
            height: 29,
          ),
          title: const Text('Notificaciones',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right, color: gray),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/7653/7653682.png'),
            width: 29,
            height: 29,
          ),
          title: const Text('Método de Pago',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right, color: gray),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3916/3916808.png'),
            width: 29,
            height: 29,
          ),
          title: const Text('Historial',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: gray,
            ),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/8770/8770923.png'),
            width: 29,
            height: 29,
          ),
          title: const Text('Mi código de promoción',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right, color: gray),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 50),
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/9811/9811205.png'),
            width: 29,
            height: 29,
          ),
          title: const Text('Configuración',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right, color: gray),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3917/3917717.png'),
            width: 29,
            height: 29,
          ),
          title: const Text(
            'Invitar amigos',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right, color: gray),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3917/3917673.png'),
            width: 29,
            height: 29,
          ),
          title: Text(
            'Centro de ayuda',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: gray,
            ),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3916/3916714.png'),
            width: 29,
            height: 29,
          ),
          title: const Text('Sobre nosotros',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon( Icons.chevron_right, color: gray),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3914/3914420.png'),
            width: 29,
            height: 29,
          ),
          title: Text('Terminos y condiciones',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: gray,
            ),
            onPressed: () {},
          ),
        ),
        ListTile(
          leading: const Image(
            image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/660/660350.png'),
            width: 29,
            height: 29,
          ),
          title: const Text('Cerrar Sesión',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right, color: gray),
            onPressed: () => _signOut(context),
          ),
        )

      ]),
    );
  }


  void _signOut(BuildContext context) async {
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
                  const Icon(Icons.logout, size: 130,color: Colors.orange),
                  Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("Cierre de sesión en curso", style:  TextStyle(
                          color: primaryColor,
                          fontSize: 20.0
                      ))
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text("¿Desea salir de la sesión actual?",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0)),
                  ),
                  createElevatedButton(
                      color: secondaryColor,
                      labelButton: "Cerrar sesión",
                      shape: const StadiumBorder(),
                      func: (){
                        _viewModel.signOut().then((_) {
                          Navigator.pushReplacement(context,
                              PageRouteBuilder(pageBuilder: (_,__,____) => const WelcomePage(),
                                transitionDuration: const Duration(seconds: 0)
                              ));
                        });
                      }
                  )
                ],
              ),
            ),
          );
        });
  }


}




