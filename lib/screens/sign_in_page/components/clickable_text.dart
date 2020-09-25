import 'package:flutter/material.dart';
import 'package:todo_app/colors.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  const ClickableText({Key key, @required this.text, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.kTransparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
