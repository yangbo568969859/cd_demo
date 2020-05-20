
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  const MyCard({
    Key key,
    @required this.child,
    this.color: Colors.white,
    this.borderRadius: 8.0,
    this.shadowColor: const Color.fromRGBO(0, 0, 0, 0.02)
  }): super(key: key);
  
  final Widget child;
  final Color color;
  final Color shadowColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(color: shadowColor, offset: Offset(0.0, 2.0), blurRadius: 8.0, spreadRadius: 0.0),
          ]
      ),
      child: child,
    );
  }
}
