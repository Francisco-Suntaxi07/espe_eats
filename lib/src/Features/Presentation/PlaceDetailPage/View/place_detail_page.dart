import 'package:flutter/material.dart';

//Widgets
import 'package:espeats/src/Features/Presentation/CommonWidgets/back_button.dart';
//Colors
import 'package:espeats/src/Colors/colors.dart';

class PlacesDetailPage extends StatelessWidget {
  const PlacesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
      backgroundColor: secondaryColor,
        label: const Text('Añadir al Carrito \$90.5 ', style: (TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17.0)),),
    ),
    body: CustomScrollView(
      slivers: <Widget>[
       SliverAppBar(
         backgroundColor: Colors.black,
         expandedHeight: 326,
         flexibleSpace: FlexibleSpaceBar(
           background: Stack(
             children: [
               const Image(
                   width: double.infinity,
                   height: 350.0,
                   fit: BoxFit.cover,
                   image: NetworkImage('https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfDF8MHw%3D&auto=format&fit=crop&w=500&q=60')
               ),
               Container(
                 decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 1.5)),
                 width: double.infinity,
                 height: 350,
               ),
               Wrap(
                 children: [
                   _promoButton(),
                   _infoPlace(),
                   _infoPlaceStat()
                 ],
               )
             ],
           ),
         ),
         leading: Builder(builder: (BuildContext context){
           return backButton(context, Colors.white);
         }),
         actions: [
           IconButton(
             onPressed: (){},
             icon: const Icon(
               Icons.ios_share,
               color: Colors.white,
               size: 30,
             ),),
           IconButton(
               onPressed: (){},
               icon: const Icon(
                 Icons.bookmark_border_sharp,
                 color: Colors.white,
                 size: 30,
               ),)
         ],
       ),
        SliverList(
            delegate: SliverChildListDelegate(
              [
                _headers("Populars"),
                _sliderCards(context),
                _headers("Full Menu"),
                _menuList(context),
                _headers("Reviews"),
                _reviews(),
                _headers("Your Rating"),
                _yourRating(),
                const SizedBox(height: 150.0),
              ]
            ))
      ],
    ),
  );
  }
}

Widget _headers(String text){
  return Container(
    margin: const EdgeInsets.only(top: 20, bottom: 10.0),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child:  Text(text, style:const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold )),
  );
}

Widget _promoButton(){
  return Container(
    margin: const EdgeInsets.only(top:156.0,left: 30.0,right: 15.0),
    width: double.infinity,
    height: 25,
    child: Row(
      children: [
        SizedBox(
          width: 98,
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bgWhiteOp,
              shape: const StadiumBorder(),
              elevation: 0.5,
            ),
            onPressed: () {},
            child: const Text("Free Delivery", style:TextStyle(fontSize: 11.0)),
          ),
        )
      ],
    ),
  );
}

Widget _infoPlace(){
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        alignment: Alignment.bottomLeft,
        child: const Text("Free Delivery", style:TextStyle(fontSize: 30.0, color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child:const Row(
        children: [
          Icon(Icons.location_on, color: gray),
           Text("Free Delivery",
              style: TextStyle(fontSize: 15.0,
                  color: Colors.white,)),
        ],
        )
      )
    ],
  );
}

Widget _infoPlaceStat(){
  return Container(
    margin: const EdgeInsets.only(top:26.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 70.0,
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: bgWhiteOp),
        bottom: BorderSide(color: bgWhiteOp),
        )),
    child: Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star,color: Colors.white, size: 19.0,),
                Text('4.5', style: TextStyle(color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),)
              ],
            ),
            Text('351 Ratings', style: TextStyle(color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500),)
          ],
        ),
        Container(
          height: 40.0,
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: bgWhiteOp))
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bookmark,color: Colors.white, size: 19.0,),
                Text('137k', style: TextStyle(color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),)
              ],
            ),
            Text('Bookmark', style: TextStyle(color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500),)
          ],
        ),
        Container(
          height: 40.0,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: bgWhiteOp))
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.photo,color: Colors.white, size: 19.0,),
                Text('346', style: TextStyle(color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),)
              ],
            ),
            Text('Photo', style: TextStyle(color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500),)
          ],
        ),
      ],
    ),
  );
}

Widget _sliderCards(BuildContext context){
  final imageUrls = [
    'https://images.unsplash.com/photo-1581546104493-f7e013a136ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfDF8MHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1581546104493-f7e013a136ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  ];
  return SizedBox(
      height: 210.0,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext _, int index){
            return _cards(context, imageUrls[index]);
          }),
    )
  );
}

Widget _cards(BuildContext context, String photo){
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
              width: 200.0,
              height: 100.0,
              fit: BoxFit.cover,
              image: NetworkImage(photo),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, left: 1),
          child: const Text("Free Delivery", style:TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold )),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 1),
          child: const Text("\$4.5", style:TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: gray )),
        ),
        Row(
         children: [
           Container(
             margin: const EdgeInsets.only(top:10),
             child: const Text("Selecciona",
                 style:TextStyle(
                     fontSize: 15.0,
                     fontWeight: FontWeight.w500,
                     color: secondaryColor)),
           ),
           Container(
             margin: const EdgeInsets.only(top:10, left: 105),
             child: const Image(
               width: 20.0,
               height: 20.0,
               fit: BoxFit.cover,
               image: AssetImage('assets/icons/add.png'),
             ),
           ),
         ],
        )
      ],
    ),
  );
}

Widget _menuList(BuildContext context){
  return Container(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(
      children: [
        _menuItem(context, 'Salads', '2'),
        _menuItem(context, 'Chicken', '5'),
        _menuItem(context, 'Soups', '6'),
        _menuItem(context, 'Vegetables', '7'),
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String texto, String itemCount){
  return Container(
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: grayOp))
    ),
    child:  Column(
      children: [
        ListTile(
          title: Text(texto, style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300)),
          trailing: Text(itemCount, style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300)),
        ),
        _sliderCards(context)
      ],
    ),
  );
}

Widget _reviews() {
  return Container(
    height: 160.0,
    padding: const EdgeInsets.only(left: 10.0),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return _cardReviews();
        }
    ),
  );
}

Widget _cardReviews(){
  var lorem="Recientemente tuve la oportunidad de probar una comida verdaderamente excepcional, y no puedo dejar de elogiar cada aspecto de esta experiencia gastronómica.";
  return Container(
    margin: const EdgeInsets.only(top:10),
    padding: const EdgeInsets.only(top: 10, right: 10),
    width: 350,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: const Image(
                width: 49.0,
                height: 43.0,
                fit: BoxFit.cover,
                image: NetworkImage('https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfDF8MHw%3D&auto=format&fit=crop&w=500&q=60'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Luis Espinosa", style:TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold )),
                  Text("24 Reviews", style:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500 )),
                ],
              ),
            ),
            const Spacer(),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: secondaryColor,
                  width: 60,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4", style:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white)),
                      Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top:10.0),
          child:  Text(lorem, style:const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: gray)
          ,textAlign: TextAlign.justify,),
        ),
        Container(
          margin: const EdgeInsets.only(top:10.0),
          child:  const Text("See full review", style:TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: secondaryColor)),
        ),
      ],
    ),
  );
}

Widget _yourRating(){
  var lorem="Recientemente tuve la oportunidad de probar una comida verdaderamente excepcional, y no puedo dejar de elogiar cada aspecto de esta experiencia gastronómica.";
  return Container(
    margin: const EdgeInsets.only(top:10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: secondaryColorOp,
                  width: 60,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("1", style:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white)),
                      Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: secondaryColorOp,
                  width: 60,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("2", style:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white)),
                      Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: secondaryColorOp,
                  width: 60,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("3", style:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white)),
                      Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: secondaryColorOp,
                  width: 60,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4", style:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white)),
                      Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: secondaryColor,
                  width: 60,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("5", style:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white)),
                      Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: Text(lorem, style:const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: gray)
              , textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: const Text("+ Edit your review", style:TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: secondaryColor)
              , textAlign: TextAlign.left),
        ),
      ],
    ),
  );
}