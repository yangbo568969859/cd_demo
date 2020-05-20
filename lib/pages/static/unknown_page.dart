import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('页面不存在哦'),
        ),
      ),
    );
  }
}