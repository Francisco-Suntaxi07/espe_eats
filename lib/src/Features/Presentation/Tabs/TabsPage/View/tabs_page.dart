import 'package:espeats/src/Features/Presentation/Shared/Components/Alerts/ErrorAlertView/error_alert_view.dart';
import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';
//Widgets Options
import 'package:espeats/src/Features/Presentation/Tabs/FavoriteTab/View/favorite_tab.dart';
import 'package:espeats/src/Features/Presentation/Tabs/HomeTab/View/home_tab.dart';
import 'package:espeats/src/Features/Presentation/Tabs/MyOrderTab/my_order_tab.dart';
import 'package:espeats/src/Features/Presentation/Tabs/ProfileTab/View/profile_tab.dart';


class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,(){
      _askLocation(context);
    })  ;
  }

  final List<Widget> _widgetOption = [
    const HomeTab(),
    const FavoriteTab(),
    const MyOrderTab(),
    const ProfileTab()
  ];

  int _seletedItemIndex = 0;

  void _changeWidget(int index){
    setState(() {
      _seletedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_seletedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context){
    return BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: colortab,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _seletedItemIndex,
        onTap: _changeWidget,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.flatware),
              label: "Inicio",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: "Favoritos"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_rounded),
              label: "Mi orden"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Perfil"
          )
        ]
    );
  }

  Future _askLocation(BuildContext context) async {
    ErrorAlertView.showErrorAlertDialog(context: context,
        subTitle: "Probando alerta de error",
        ctaButtonAction: () {
          Navigator.pop(context);
        });

  }

}

