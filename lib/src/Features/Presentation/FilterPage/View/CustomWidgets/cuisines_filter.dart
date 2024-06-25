import 'package:espeats/src/Colors/colors.dart';
import 'package:flutter/material.dart';

class CuisinesFilter extends StatefulWidget {
  const CuisinesFilter({super.key});

  @override
  State<CuisinesFilter> createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  bool btnAmerican = false;
  bool btnSushi = false;
  bool btnAsian = false;
  bool btnPizza = false;

  bool btnDesserts = false;
  bool btnFastFood = false;
  bool btnMexican = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           _roundedButtonFilter(() {
             setState(() => btnAmerican =! btnAmerican);
           }, btnAmerican, "Americana"),
           _roundedButtonFilter(() {
             setState(() => btnAsian =! btnAsian);
           }, btnAsian, "Asiatica"),
           _roundedButtonFilter(() {
             setState(() => btnMexican =! btnMexican);
           }, btnMexican, "Mexicana"),
         ]
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           _roundedButtonFilter(() {
             setState(() => btnFastFood =! btnFastFood);
           }, btnFastFood, "Comida rapida"),
           _roundedButtonFilter(() {
             setState(() => btnDesserts =! btnDesserts);
           }, btnDesserts, "Postre"),
           _roundedButtonFilter(() {
             setState(() => btnSushi =! btnSushi);
           }, btnSushi, "Sushi"),
         ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           _roundedButtonFilter(() {
             setState(() => btnPizza =! btnPizza);
           }, btnPizza, "Pizza")
         ],
       )
      ]
    );
  }
}

Widget _roundedButtonFilter(Function()? fun, bool isActive, String labelText){
  return SizedBox(
    child: ElevatedButton(
        onPressed: fun,
        style: ElevatedButton.styleFrom(
          elevation: 0.5,
          minimumSize: const Size(100, 30),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: isActive ? secondaryColor : gray)
          )
        ),
        child: Text(labelText, style: TextStyle(
          color: isActive ? secondaryColor : gray
        ))
    ),
  );
}