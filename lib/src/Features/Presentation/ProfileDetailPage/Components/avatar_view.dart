import 'package:espeats/src/Colors/colors.dart';
import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  final String backgroundImage;
  AvatarView({required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 142,
          height: 142,
          child: CircleAvatar(
            backgroundImage: NetworkImage(backgroundImage),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -35),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: pink, borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
