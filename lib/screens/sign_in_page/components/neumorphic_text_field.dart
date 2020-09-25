import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/models/theme.dart';

class NeumorphicTextField extends StatelessWidget {
  final double width;
  final String hintText;
  final bool isPassword;
  final ValueChanged<String> onChanged;

  const NeumorphicTextField({Key key, @required this.width, @required this.hintText, this.isPassword, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: NeuCard(
          decoration: NeumorphicDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).backgroundColor,
          ),
          curveType: CurveType.emboss,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1,
                fillColor: Theme.of(context).backgroundColor,
              ),
              obscureText: isPassword,
              style: Theme.of(context).textTheme.bodyText1,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
