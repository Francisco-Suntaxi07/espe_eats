import 'package:flutter/material.dart';
import 'package:espeats/src/Colors/colors.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/Texts/TextView/text_view.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/rounded_button.dart';
import 'package:espeats/src/Features/Presentation/Tabs/MyOrderTab/Components/empty_view.dart';
import 'package:espeats/src/Features/Presentation/Tabs/MyOrderTab/Components/list_order_views.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({super.key});

  @override
  State<MyOrderTab> createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGray,
        body: emptyOrderState ?  const EmptyOrderView() :  CustomScrollView(
          slivers : [
            const SliverAppBar(
              elevation: 0.5,
              leading: Text(''),
              backgroundColor: Colors.white,
              title: Text(
                'Mi Orden',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          _orders(context),
                          const SizedBox(height: 40),
                          _checkoutResume(context),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        )
    );
  }
}


Widget _orders(BuildContext context) {
  return Column(
    children: [_cardOrder(context)],
  );
}

Widget _cardOrder(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    margin: const EdgeInsets.symmetric(vertical: 10.0),
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
        Row(
          children: [_cardOrderTopContent()],
        ),
        Column(
          children: [
            _items(context),
            _items(context),
            _items(context),
            _items(context)
          ],
        ),
        _moreContent(context)
      ],
    ),
  );
}

Widget _cardOrderTopContent() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 20.0),
          child: const TextView(
              texto: "Secos del gordo",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: gray, size: 16.0),
              const TextView(
                  texto: "87 Botsford Circle Apt",
                  color: gray,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: 110.0,
                  height: 20.0,
                  child: createElevatedButton(
                      shape: const StadiumBorder(),
                      color: Colors.orange,
                      labelColor: Colors.white,
                      labelButton: 'Free Delivery',
                      labelFontSize: 11.0))
            ],
          ),
        )
      ],
    ),
  );
}
Widget _items(context) {
  return Container(
    decoration: BoxDecoration(
        border:
        Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: const ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
              texto: 'Almuerzo completo',
              color: secondaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 15.0),
          TextView(
              texto: 'Solo segundo',
              color: gray,
              fontWeight: FontWeight.w300,
              fontSize: 12.0)
        ],
      ),
      trailing: TextView(
          texto: '2.00 \$',
          color: gray,
          fontWeight: FontWeight.w300,
          fontSize: 15.0),
    ),
  );
}
Widget _moreContent(context) {
  return Container(
    child: const ListTile(
      title: TextView(
          texto: 'Agregar más items',
          color: pink,
          fontWeight: FontWeight.w600,
          fontSize: 17.0),
    ),
  );
}

Widget _checkoutResume(context) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        _itemsCheckOutResume(
            title: 'Subtotal', value: '8.00 \$', context: context),
        _itemsCheckOutResume(
            title: 'Recargo', value: '1.00 \$', context: context),
        _itemsCheckOutResume(
            title: 'Delivery', value: 'Gratis', context: context),
        _buttonCheckout(context)
      ],
    ),
  );
}

Widget _itemsCheckOutResume(
    {title = String, value = String, context = BuildContext}) {
  return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: TextView(
            texto: title, fontWeight: FontWeight.w400, fontSize: 15.0),
        trailing: TextView(
            texto: value, fontWeight: FontWeight.w500, fontSize: 15.0),
      ));
}

Widget _buttonCheckout(context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0.5,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: () {
        Navigator.pushNamed(context, 'checkout');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: const TextView(
                texto: 'Pedir',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Container(
            child: const TextView(
                texto: '9.00 \$',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
    ),
  );
}