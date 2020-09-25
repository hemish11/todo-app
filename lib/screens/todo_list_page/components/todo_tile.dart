import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final String description;
  final GestureTapCallback onTap;

  const TodoTile({Key key, @required this.title, @required this.description, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return NeuCard(
      height: size.height * 0.1,
      width: size.width - 30,
      margin: const EdgeInsets.all(15.0),
      decoration: NeumorphicDecoration(
        color: CustomColors.kLight,
        borderRadius: BorderRadius.circular(size.height * 0.05),
      ),
      curveType: CurveType.flat,
      bevel: 10,
      child: Material(
        color: CustomColors.kTransparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(size.height * 0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: GoogleFonts.lato(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
