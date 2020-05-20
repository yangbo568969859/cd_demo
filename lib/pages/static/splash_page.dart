import 'package:flutter/material.dart';

// import 'package:data_analysis/pages/home/index.dart';
import 'package:data_analysis/pages/home/home_nav.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  bool hadInit = false;

  @override  
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    Future.delayed(Duration(seconds: 2, milliseconds: 500), () {
      goNextPage();
    });
  }

  void goNextPage() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeBottomNav()), (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/static/demo_splash.jpg', 
              width: double.infinity, 
              height: double.infinity, 
              scale: 1.0, 
              fit: BoxFit.cover
            ),
          )
        ],
      ),
    );
  } 
}