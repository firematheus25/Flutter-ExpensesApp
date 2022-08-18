import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label),
            onPressed: onPressed(),
            color: Theme.of(context).primaryColor,
          )
        : ElevatedButton(
            child: Text(label),
            onPressed: onPressed(),
          );
  }
}
