import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/Texts/TextView/text_view.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/rounded_button.dart';

class ListOrdersView extends StatelessWidget {
  const ListOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: Colors.white,
        title: TextView(
            texto: 'Ordenes Pasadas',
            color: const ColorScheme.dark().onSecondary,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
              [
                const ListOrderCard(),
                const ListOrderCard(),
                const ListOrderCard()
              ]
          ))
        ],
      ),
    );
  }
}

class ListOrderCard extends StatelessWidget {
  const ListOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(248, 248, 248, 1.0),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(210, 211, 215, 1.0),
                spreadRadius: 1.0,
                blurRadius: 4.0)
          ]),
      child: Column(
        children: [
          const ListCardOrderHeader(),
          const ListCardOrderItem(),
          const SizedBox(height: 10),
          const TextView(
              texto: 'Ver Orden',
              fontSize: 17,
              color: pink,
              fontWeight: FontWeight.w400
          ),
          createElevatedButton(
              labelColor: Colors.white,
              labelButton: 'Ordenar de Nuevo',
              color: Colors.orange,
              func: (){},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ListCardOrderHeader extends StatelessWidget {
  const ListCardOrderHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 20.0),
                        child: const TextView(
                            texto: "Los Secos del Gordo",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on, color: gray, size: 16.0),
                              TextView(
                                  texto: "Frente a la ESPE Lote 323",
                                  color: gray,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0)
                            ],
                          )
                      ),
                    ],
                  ),
                  createElevatedButton(
                      width: 160,
                      height: 28,
                      labelColor: Colors.white,
                      labelButton: "Entregado - 21/06/23",
                      labelFontSize: 12,
                      color: Colors.green,
                      shape: const StadiumBorder(),
                      func: () {}
                  )
                ],
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    width: 70,
                    height: 74,
                    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2bxbXC7s9zVztfciX5jAOGA3rbGPJa7e0Nw&usqp=CAU'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ListCardOrderItem extends StatelessWidget {
  const ListCardOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: const ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
                texto: '2 productos',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.0)
          ],
        ),
        trailing: TextView(
            texto: '11.55 Dólares',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      ),
    );
  }
}
