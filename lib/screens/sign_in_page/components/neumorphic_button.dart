import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/models/theme.dart';

class NeumorphicButton extends StatelessWidget {
  final double width;
  final GestureTapCallback onTap;

  const NeumorphicButton({Key key, @required this.width, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      width: width,
      height: 80,
      decoration: NeumorphicDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Theme.of(context).backgroundColor,
      ),
      bevel: 10,
      curveType: CurveType.flat,
      child: Material(
        color: CustomColors.kTransparent,
        child: SizedBox(
          height: 80,
          width: width,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
