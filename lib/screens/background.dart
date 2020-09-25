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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.15 - 30,
                    ),
                    SizedBox(height: size.height * 0.85 - 30, child: child),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomColors.kLight,
                    CustomColors.kLight.withAlpha(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.5],
                ),
              ),
              height: size.height * 0.3,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 15),
              child: Row(
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
                  NeuCard(
                    decoration: NeumorphicDecoration(
                      color: CustomColors.kLight,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 60,
                    width: 60,
                    bevel: 20,
                    curveType: CurveType.flat,
                    alignment: Alignment.center,
                    child: Material(
                      color: CustomColors.kTransparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Transform.rotate(
                          angle: math.pi / 6,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Icon(
                              Icons.brightness_3,
                              color: CustomColors.kLightAccent,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
