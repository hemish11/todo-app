import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/services/firebase_auth.dart';

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10.0),
      child: NeuCard(
        height: 70,
        width: 70,
        curveType: CurveType.emboss,
        decoration: NeumorphicDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Material(
          color: CustomColors.kTransparent,
          child: InkWell(
            onTap: () => FbaseAuth.signOut().then((value) => Navigator.pop(context)),
            child: SizedBox(
              height: 70,
              width: 70,
              child: Icon(
                Icons.arrow_back,
                size: 35,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
