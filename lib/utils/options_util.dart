import 'package:data_analysis/themes/normal_theme_data.dart';
import 'package:flutter/material.dart';



class CounterPage extends StatefulWidget {
  CounterPage({
    Key key,
    this.initialCount = 0,
    this.child,
  }) : super(key: key);

  final Widget child;
  final int initialCount;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void _incrementCounter() => setState(() {
    if (count == 0) {
      count = 1;
    } else {
      count = 0;
    }
  });


  @override
  Widget build(BuildContext context) {

    return CountContainer(
      //increment: _incrementCounter,
        model: this,
        increment: _incrementCounter,
        child: widget.child
    );
  }
}


class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CountContainer>();

  final _CounterPageState model;

  final Function() increment;


  CountContainer({
    Key key,
    @required this.model,
    @required this.increment,
    @required Widget child,
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) => model != oldWidget.model;

}


class ThemeProvider extends ChangeNotifier {
  String theme = 'Light';
  bool _isDark = false;
  void setTheme(bool theme1) {
    _isDark = theme1;
    notifyListeners();
  }

  ThemeMode getThemeMode(){
    return _isDark == true ? ThemeMode.light : ThemeMode.dark;
  }

  getTheme({bool isDarkMode: false}) {
    return isDarkMode == true ? ThemeMode.light : ThemeMode.dark;
  }
}
