import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.15,
        width: size.width - 30,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).backgroundColor,
              Theme.of(context).backgroundColor.withAlpha(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.5, 0.9],
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(20.0),
        child: NeuCard(
          width: size.width - 100,
          height: 60,
          decoration: NeumorphicDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).backgroundColor,
          ),
          bevel: 10,
          curveType: CurveType.flat,
          child: Material(
            color: CustomColors.kTransparent,
            child: SizedBox(
              height: 60,
              width: size.width - 100,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.add,
                        size: 30,
                        color: Theme.of(context).textTheme.headline3.color,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
