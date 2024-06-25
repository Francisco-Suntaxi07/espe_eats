import 'package:flutter/material.dart';

//Colors
import '../../../../Colors/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color:Colors.black, size: 40.0),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Text("Buscar", style: Theme.of(context).textTheme.headlineSmall)
                    ),
                    _searchInput(context),
                    const SizedBox(
                      height: 30.0,
                    ),
                    headerDoubleText(context,"Búsqueda reciente","Limpiar todo"),
                    _sliderRecentSearch(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    headerDoubleText(context,"Recomendado para ti",""),
                    _popularsCard(context: context, image: const NetworkImage('https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'),
                    title: "Carpas", subtitle: "Frente a la ESPE",
                    review: "5.0", ratings: "233 Calificaciones",
                    buttonText: "Delivery", hasActionButton: false),
                    _popularsCard(context: context, image: const NetworkImage('https://licoreschullavida.com/wp-content/uploads/2020/07/switch-trago.jpg'),
                        title: "Carpas", subtitle: "Frente a la ESPE",
                        review: "5.0", ratings: "233 Calificaciones",
                        buttonText: "Delivery", hasActionButton: false),
                  ],
                ),
              )
            ]
          ))
        ],
      ),
    );
  }
}

Widget _searchInput(BuildContext context){
  return Container(
    height: 40.0,
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 5.0),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(142, 142, 147, 1.2),
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5.0),
        prefixIcon: Icon(Icons.search, color:gray),
        hintText: 'Buscar',
        border: OutlineInputBorder(borderSide:  BorderSide.none)
      ),
    ),
  );
}

Widget headerDoubleText(BuildContext context, String? textHeader, String? textAction) {
  return Container(
    child: Row(
      children: [
        Text(textHeader!, style: Theme.of(context).textTheme.titleLarge),
        const Spacer(),
        Text(textAction!, style: const TextStyle(
            color: orange,
            fontWeight: FontWeight.w500,
            fontSize: 15.0
        ))
      ],
    ),
  );
}

Widget _sliderRecentSearch(){
  return Container(
    margin: const EdgeInsets.only(top: 5.0),
    height: 190.0,
    child: ListView.builder(
      itemCount: 4,
        scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index){
          return _card(context);
        }),
  );
}

Widget _card(BuildContext context){
  return Container(
    margin: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
            child: const Image(
              width: 160.0,
              height: 120.0,
              fit: BoxFit.cover,
              image: NetworkImage('https://images.unsplash.com/photo-1585703900468-13c7a978ad86?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'))
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: const Text("Secos del gordo", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17.0
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Alado de las carpas", style: Theme.of(context).textTheme.bodySmall)
            )
          ],
        )
      ],
    ),
  );
}

Widget _popularsCard({required BuildContext context, required ImageProvider<Object> image,
  double marginTop = 0.0,double marginRight = 0.0,double marginBottom = 0.0,double marginLeft = 0.0,
  String? title, String? subtitle,
  String? review, String? ratings,
  String? buttonText, required bool hasActionButton}){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: marginTop, right: marginRight, bottom: marginBottom, left: marginLeft),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                  image: image,
                )
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Text(title??"TitleD", style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0))
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(subtitle??"subtitleD", style: Theme.of(context).textTheme.bodySmall),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: yellow,size: 16.0),
                      Text(review??"Default", style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13.0)),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Text(ratings??"Default", style: Theme.of(context).textTheme.bodySmall),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 20.0),
                          width: 80.0,
                          height: 18.0,
                          child: hasActionButton ? ElevatedButton(//poner color del theme//
                            style: ElevatedButton.styleFrom(
                              elevation: 0.5,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: Text(buttonText??"Default", style:const TextStyle(fontSize: 11.0)),
                          ) : const Text("")
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}