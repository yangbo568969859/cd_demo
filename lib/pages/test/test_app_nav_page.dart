import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const platform = MethodChannel('samples.chenhang/navigation');

class TestAppNavPage extends StatefulWidget {
  @override
  _TestAppNavPageState createState() => _TestAppNavPageState();
}

class _TestAppNavPageState extends State<TestAppNavPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试app和flutter路由'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('Go pageA'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageA()));
            // platform.invokeMethod('openNativePage');
          },
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Go pageB'),
      onPressed: () {
        platform.invokeMethod('openNativePage');
      },
    );
  }
}