// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:bloc_app/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Results character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: MyColors.grey,
          child: character.image!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: "assets/images/Loading_Dots_In_Yellow.gif",
                  image: character.image!,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/images/Error404.gif"),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            "${character.name}",
            style: TextStyle(
              color: MyColors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
