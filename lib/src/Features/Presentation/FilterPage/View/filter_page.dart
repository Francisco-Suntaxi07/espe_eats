import 'package:espeats/src/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:espeats/src/Features/Presentation/FilterPage/View/CustomWidgets/list_tile_checked.dart';
import 'package:espeats/src/Features/Presentation/FilterPage/View/CustomWidgets/price_filter.dart';
import 'CustomWidgets/cuisines_filter.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {


  bool topRater = false;
  bool nearMe = false;
  bool costHighToLow = false;
  bool costLowToHigh = false;
  bool mostPopular = false;

  //FILTERS booleans
  bool openNow = false;
  bool creditCard = false;
  bool alcoholServerd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
          child: _appBar(context)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                  child: const Text("COCINAS", style: TextStyle(
                    color: gray,
                    fontWeight: FontWeight.w600,
                    fontSize: 17
                  )),
                ),
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 15) ,
                    child:  const CuisinesFilter()),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                  child: const Text("ORDENAR POR", style: TextStyle(
                      color: gray,
                      fontWeight: FontWeight.w600,
                      fontSize: 17))
                ),
                _sortByContainer(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                  child: const Text("FILTRAR", style: TextStyle(
                      color: gray,
                      fontWeight: FontWeight.w600,
                      fontSize: 17))
                ),
                _filterContainer(),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                    child: const Text("PRECIO", style: TextStyle(
                        color: gray,
                        fontWeight: FontWeight.w600,
                        fontSize: 17))
                ),
                const PriceFilter()
              ])
          )
        ],
      ),
    );
  }

  Widget _sortByContainer(){
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 15) ,
        child: Column(
          children: [
            ListTileChecked(
                text: "Mejor calificados",
                isActive: topRater,
                fun: (){
                  setState(() => topRater = !topRater);
                }),
            ListTileChecked(
                text: "Cerca de mí",
                isActive: nearMe,
                fun: (){
                  setState(() => nearMe = !nearMe);
                }),
            ListTileChecked(
                text: "Costo de mayor a menor",
                isActive: costHighToLow,
                fun: (){
                  setState(() => costHighToLow = !costHighToLow);
                }),
            ListTileChecked(
                text: "Costo de menor a mayor",
                isActive: costLowToHigh,
                fun: (){
                  setState(() => costLowToHigh = !costLowToHigh);
                }),
            ListTileChecked(
                text: "Más popular",
                isActive: mostPopular,
                fun: (){
                  setState(() => mostPopular = !mostPopular);
                })
          ],
        )
    );
  }

  Widget _filterContainer(){
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 15) ,
        child: Column(
          children: [
            ListTileChecked(
                text: "Abierto ahora",
                isActive: openNow,
                fun: (){
                  setState(() => openNow = !openNow);
                }),
            ListTileChecked(
                text: "Tarjetas de credito",
                isActive: creditCard,
                fun: (){
                  setState(() => creditCard = !creditCard);
                }),
            ListTileChecked(
                text: "Servicio de Alcohol",
                isActive: alcoholServerd,
                fun: (){
                  setState(() => alcoholServerd = !alcoholServerd);
                })
          ],
        )
    );
  }

}

Widget _appBar(BuildContext context){
  return AppBar(
    elevation: 0.7,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: const Text("Filtros", style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20.0
    )),
    leadingWidth: 100.0,
    leading: Container(
      padding: const EdgeInsets.only(top: 20, left: 7.0),
      child: const Text("Resetear", style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 17.0
      )),
    ),
    actions: [
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 7.0),
          child: const Text("Hecho", style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 17.0
          )),
        ),
      )
    ],
  );
}
