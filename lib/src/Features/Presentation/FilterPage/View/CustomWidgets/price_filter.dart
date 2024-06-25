import 'package:espeats/src/Colors/colors.dart';
import 'package:flutter/material.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  //PROPERTIES
  RangeValues _values = const RangeValues(0.3, 1.0);
  int _minPrice = 0;
  int _maxPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       Text("\$ $_minPrice", style: const TextStyle(fontSize: 16)),
        SizedBox(
          width: 300,
          child: RangeSlider(
            activeColor: secondaryColor,
            inactiveColor: gray,
            values: _values,
            min: 0,
            max: 100.0,
            onChanged: (RangeValues newValues){
              setState(() {
                _values = newValues;
                _minPrice = _values.start.round();
                _maxPrice = _values.end.round();
              });
            },
          ),
        ),
        Text("\$ $_maxPrice", style: const TextStyle(fontSize: 16))
      ]
    );
  }
}
