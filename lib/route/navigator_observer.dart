
import 'package:flutter/material.dart';

int totalPV = 0;

class MyObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    totalPV++; //累加pv
  }
}