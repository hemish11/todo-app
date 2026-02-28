import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/screens/todo_list_page/components/sign_out_button.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool showSignOutButton;

  const Background({Key key, @required this.child, this.showSignOutButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final backgroundColor = Theme.of(context).backgroundColor;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColor,
            backgroundColor,
            CustomColors.kTransparent,
            backgroundColor,
          ],
          stops: const [0.0, 0.2, 0.5, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.15 - 15,
                    ),
                    SizedBox(height: size.height * 0.85 - 15, child: child),
                  ],
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Container(
                height: size.height * 0.3,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 15),
                child: NeuText(
                  'ToDo',
                  parentColor: backgroundColor,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            if (showSignOutButton) SignOutButton(),
          ],
        ),
      ),
    );
  }
}
