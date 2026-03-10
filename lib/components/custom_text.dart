import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;

  const CustomText({
    Key key,
    @required this.text,
    this.padding = const EdgeInsets.only(left: 20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
