import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic showAlertDialog({BuildContext context, String title, String content}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Platform.isAndroid
          ? AlertDialog(
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              content: Text(
                content,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
              backgroundColor: Theme.of(context).backgroundColor,
            )
          : CupertinoAlertDialog(
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              content: Text(
                content,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text('Ok'),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
    },
  );
}
