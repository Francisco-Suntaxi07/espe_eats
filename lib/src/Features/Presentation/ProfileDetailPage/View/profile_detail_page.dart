  import 'package:espeats/src/Colors/colors.dart';
import 'package:espeats/src/Features/Presentation/ProfileDetailPage/Components/texfields_view.dart';
import 'package:espeats/src/Features/Presentation/CommonWidgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:espeats/src/Utils/Extensions/screen_size.dart';
import 'package:espeats/src/Features/Presentation/ProfileDetailPage/Components/avatar_view.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      appBar: AppBar(
        title: Text(
          'Editar Perfil',
          style: TextStyle(fontSize: 17),
        ),
        backgroundColor: Colors.white,
        elevation: 0.4,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(top: 20, right: 15.0),
              child: Text(
                'Done',
                style: TextStyle(
                    color: orange, fontWeight: FontWeight.w500, fontSize: 17.0),
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight.getScreenHeight(
                      context: context, multiplier: 0.1),
                  left: 15,
                  right: 15),
              width: screenWidth.getScreenWidth(context: context),
              height: screenHeight.getScreenHeight(
                  context: context, multiplier: 0.85),
              child: Column(children: [
                Transform.translate(
                  offset: Offset(0, -60),
                  child: AvatarView(
                      backgroundImage:
                          'https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVyZmlsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
                ),
                TextFieldsProfileDetailView()
              ]),
            )
          ]))
        ],
      ),
    );
  }
}
