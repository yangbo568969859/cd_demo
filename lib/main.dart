import 'dart:io';
import 'package:data_analysis/pages/home/home_nav.dart';
// import 'package:data_analysis/pages/home/index.dart';
import 'package:data_analysis/pages/test/test_page.dart';
import 'package:data_analysis/pages/static/splash_page.dart';
import 'package:data_analysis/pages/static/unknown_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:data_analysis/themes/normal_theme_data.dart';
import 'package:data_analysis/utils/options_util.dart';
import 'package:data_analysis/route/navigator_observer.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bugly/flutter_bugly.dart';

// void main() {
//   debugPrint = (String message, {int wrapWidth}) {};
//   // debugPaintSizeEnabled = true;
//   // debugPrint = (String message, {int wrapWidth}) => debugPrintSynchronously(message, wrapWidth: wrapWidth);
//   if (Platform.isAndroid) {
//     SystemUiOverlayStyle systemUiOverlayStyle = 
//     SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//   }
//   runApp(MyApp());
// }
void main() => FlutterBugly.postCatchedException(() {
  debugPrint = (String message, {int wrapWidth}) {};
  // debugPaintSizeEnabled = true;
  // debugPrint = (String message, {int wrapWidth}) => debugPrintSynchronously(message, wrapWidth: wrapWidth);
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = 
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
});

// FlutterBugly.init(androidAppId: "879293ab21",iOSAppId: "your iOS app id");


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TargetPlatform platform;

  @override
  void initState() {
    super.initState();
    print('项目初始化');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
      builder: (_, provider, __) {
        // print(provider.getThemeMode('Light'));
        return MaterialApp(
          themeMode: provider.getThemeMode(),
          theme: NormalThemeData.lightThemeData.copyWith(
            platform: platform,
          ),
          darkTheme: NormalThemeData.darkThemeData.copyWith(
            platform: platform,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US')
          ],
          title: 'Flutter Demo',
          routes: {
            '/': (context) => SplashPage(),
            'home': (context) => HomeBottomNav(),
            'test_page': (context) => TestPage()
          },
          navigatorObservers: [
            MyObserver()
          ],
          //错误路由处理，统一返回UnknownPage
          onUnknownRoute: (RouteSettings seting) => MaterialPageRoute(builder: (context) => UnknownPage()),
        );
      },
    )
    );
    // return CounterPage();
    // return CounterPage(
    //   initialCount: 1,
    //   child: Builder(
    //     builder: (context) {
    //       CountContainer state = CountContainer.of(context);
    //       print(state.model.count);
    //       return MaterialApp(
    //         themeMode: state.model.count == 0 ? ThemeMode.light:ThemeMode.dark,
    //         theme: NormalThemeData.lightThemeData.copyWith(
    //           platform: platform,
    //         ),
    //         darkTheme: NormalThemeData.darkThemeData.copyWith(
    //           platform: platform,
    //         ),
    //         localizationsDelegates: [
    //           GlobalMaterialLocalizations.delegate,
    //           GlobalWidgetsLocalizations.delegate,
    //           GlobalCupertinoLocalizations.delegate,
    //         ],
    //         supportedLocales: const [
    //           Locale('zh', 'CH'),
    //           Locale('en', 'US')
    //         ],
    //         title: 'Flutter Demo',
    //         routes: {
    //           '/': (context) => SplashPage(),
    //           'home': (context) => HomeBottomNav(),
    //           'test_page': (context) => TestPage()
    //         },
    //         //错误路由处理，统一返回UnknownPage
    //         onUnknownRoute: (RouteSettings seting) => MaterialPageRoute(builder: (context) => UnknownPage()),
    //       );
    //     },
    //   ),
    // );
  }
}
