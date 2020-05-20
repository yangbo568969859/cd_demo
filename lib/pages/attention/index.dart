import 'package:flutter/material.dart';


class AttentionPage extends StatefulWidget {
  @override
  _AttentionPageState createState() => _AttentionPageState();
}

class _AttentionPageState extends State<AttentionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('中台数据统计详情页'),
      ),
      body: Center(),
    );
  }
}