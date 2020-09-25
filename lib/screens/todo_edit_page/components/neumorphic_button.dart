import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';

class NeumorphicButton extends StatelessWidget {
  final double width;
  final GestureTapCallback onTap;
  final bool add;
  final String text;

  const NeumorphicButton({Key key, @required this.width, @required this.onTap, @required this.add, @required this.text})
      : super(key: key);

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
              child: Text(text, style: Theme.of(context).textTheme.headline3),
            ),
          ),
        ),
      ),
    );
  }
}
