import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';
import 'dart:math' as math;

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: CustomColors.kLight,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeuText(
                    'ToDo',
                    parentColor: CustomColors.kLight,
                    style: GoogleFonts.lato(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: CustomColors.kLight,
                    ),
                  ),
                  NeuButton(
                    onPressed: () {
                      print('press');
                    },
                    decoration: NeumorphicDecoration(
                      color: CustomColors.kLight,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.rotate(
                      angle: math.pi / 6,
                      child: Icon(
                        Icons.brightness_3,
                        color: CustomColors.kLightAccent,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
