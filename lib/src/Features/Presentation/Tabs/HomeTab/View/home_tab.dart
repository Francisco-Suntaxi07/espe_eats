import 'package:flutter/material.dart';
//Colors
import 'package:espeats/src/Colors/colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
                  child: Column(
                    children: [
                      _topBar(context),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        alignment: Alignment.centerLeft,
                        child: Text("Descubre nuevos lugares", style: Theme.of(context).textTheme.headlineSmall)
                      ),
                      _sliderCards(),
                      _headers(context, "Popular esta semana","Mostrar todo"),
                      _populars(context, 'https://images.unsplash.com/photo-1581546104493-f7e013a136ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      _populars(context, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=481&q=80'),
                      _populars(context, 'https://images.unsplash.com/photo-1581546104493-f7e013a136ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      const SizedBox(height: 10.0),
                      _headers(context, "Colecciones","Mostrar todo"),
                      _sliderCollections()
                    ],
                  ),
                ),
              ])
            )
          ],
        )
    );
  }
}

Widget _topBar(BuildContext context){
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          width: 290.0,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 20.0, color: gray,),
              Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: const Text("Buscar", style: TextStyle(
                  color: gray,
                  fontSize: 17.0
                )),
              )
            ],
          ),
        ),
      ),
      Container(
        width: 45.0,
        height: 45.0,
        margin: const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(209, 209, 214, 1.0),
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: IconButton(
          icon: const Icon(Icons.filter_list,size: 30.0),
          onPressed: (){
            Navigator.pushNamed(context, 'filter_page');
          })
      )
    ],
  );
}

Widget _sliderCards(){
  return SizedBox(
    height: 350.0,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return _card(context);
        }),
  );
}

Widget _card(BuildContext context){
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'place_detail');
    },
    child: Container(
      margin: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: const Image(
              width: 240.0,
              height: 250.0,
              fit: BoxFit.cover,
              image: NetworkImage('https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfDF8MHw%3D&auto=format&fit=crop&w=500&q=60'))
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text("Don Diego", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Alado del tierrero", style: Theme.of(context).textTheme.bodySmall),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: yellow,size: 16.0),
                  const Text("4.8", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0)),
                  const Text("(20 Calificaciones)", style: TextStyle(
                      color: gray,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0)),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: 80.0,
                    height: 18.0,
                    child: ElevatedButton(//poner color del theme//
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder()
                      ),
                      onPressed: () {},
                      child: const Text("Delivery", style:TextStyle(fontSize: 11.0)),
                    ))
                  ]
                ),
              ],
          )
        ]
      )
    ),
  );
}

Widget _headers( BuildContext context, String? textHeader, String textAction){
  return Row(
    children: [
      Container(
          alignment: Alignment.centerLeft,
          child: Text(textHeader??"", style: Theme.of(context).textTheme.titleLarge)
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(textAction, style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15.0)),
            const Icon(Icons.play_arrow)]
        ),
      ),

    ],
  );
}

Widget _populars(BuildContext context, String foto){
  return Column(
    children: [
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, 'place_detail');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(foto),
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
                        child: const Text("Don Diego", style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0))
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Text("Alado del tierrero", style: Theme.of(context).textTheme.bodySmall),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: yellow,size: 16.0),
                        const Text("4.9", style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13.0)),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          child: Text("79 Calificaciones", style: Theme.of(context).textTheme.bodySmall),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 25.0),
                          width: 80.0,
                          height: 18.0,
                          child: ElevatedButton(//poner color del theme//
                            style: ElevatedButton.styleFrom(
                                elevation: 0.5,
                                shape: const StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: const Text("Delivery", style:TextStyle(fontSize: 11.0)),
                          )
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}

Widget _sliderCollections(){
  return SizedBox(
    height: 180.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return _cardColection(context);
        }
    ),
  );
}

Widget _cardColection(BuildContext context){
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
            width: 300.0,
            height: 150.0,
            fit: BoxFit.cover,
            image: NetworkImage('https://images.unsplash.com/photo-1581546104493-f7e013a136ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
          )
        ),
      ],
    ),
  );
}