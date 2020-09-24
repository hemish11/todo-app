import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/colors.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        text,
        style: GoogleFonts.lato(
          fontSize: 35,
          fontWeight: FontWeight.w500,
          color: CustomColors.kDark,
        ),
      ),
    );
  }
}
