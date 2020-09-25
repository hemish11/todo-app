import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class NeumorphicTextField extends StatelessWidget {
  final double width;
  final String hintText;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const NeumorphicTextField({Key key, @required this.width, @required this.hintText, this.isPassword, this.onChanged, this.controller})
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
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                fillColor: Theme.of(context).backgroundColor,
                hintStyle: Theme.of(context).textTheme.bodyText1,
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
