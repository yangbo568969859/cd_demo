import 'package:flutter/material.dart';

class Right2LeftRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Curve curve;
  Right2LeftRouter({this.child, this.curve = Curves.fastOutSlowIn})
  : super(
    pageBuilder: (context, animation1, animation2) => child,
    transitionsBuilder : (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1.0, 0.0),
          end: Offset(0.0, 0.0)
        ).animate(CurvedAnimation(parent: animation1, curve: curve)),
        child: child,
      );
    }
  );
}