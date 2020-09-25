import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/screens/sign_in_page/sign_in_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'ToDo App',
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: CustomColors.kLight,
        accentColor: CustomColors.kLightAccent,
        textTheme: TextTheme(
          headline1: GoogleFonts.lato(
            fontSize: 50,
            fontWeight: FontWeight.w800,
            color: CustomColors.kLight,
          ),
          headline2: GoogleFonts.lato(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: CustomColors.kDark,
          ),
          headline3: GoogleFonts.lato(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: CustomColors.kLightAccent,
          ),
          bodyText1: GoogleFonts.lato(
            fontSize: 20,
            color: CustomColors.kDark,
          ),
          bodyText2: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: CustomColors.kDark,
          ),
          subtitle1: GoogleFonts.lato(
            fontSize: 16,
            color: CustomColors.kDark,
          ),
        ),
      ),
      darkTheme: ThemeData(
        backgroundColor: CustomColors.kDark,
        accentColor: CustomColors.kDarkAccent,
        textTheme: TextTheme(
          headline1: GoogleFonts.lato(
            fontSize: 50,
            fontWeight: FontWeight.w800,
            color: CustomColors.kDark,
          ),
          headline2: GoogleFonts.lato(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: CustomColors.kLight,
          ),
          headline3: GoogleFonts.lato(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: CustomColors.kDarkAccent,
          ),
          bodyText1: GoogleFonts.lato(
            fontSize: 20,
            color: CustomColors.kLight,
          ),
          bodyText2: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: CustomColors.kLight,
          ),
          subtitle1: GoogleFonts.lato(
            fontSize: 16,
            color: CustomColors.kLight,
          ),
        ),
      ),
    );
  }
}