import 'package:flutter/material.dart';

import 'package:espeats/src/Colors/colors.dart';

class ListTileChecked extends StatefulWidget {
  final String? text;
  final bool? isActive;
  final Function()? fun;
  const ListTileChecked({super.key, this.text, this.isActive, this.fun});


  @override
  State<ListTileChecked> createState() => _ListTileCheckedState();
}

class _ListTileCheckedState extends State<ListTileChecked> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _listTails(context:context, text: widget.text, isActive: widget.isActive, fun: widget.fun)
      ],
    );
  }
}

Widget _listTails({required BuildContext context, String? text,bool? isActive, Function()? fun}){
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor
        )
      )
    ),
    child: ListTile(
      onTap: fun,
      title: Text(text??"Default", style: TextStyle(
          color: isActive??false ? secondaryColor : Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 17)),
      trailing: isActive??false ? const Icon(Icons.check, color: secondaryColor): const Text(""),
    ),
  );
}