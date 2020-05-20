import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';

// import 'package:data_analysis/widgets/dialog/tip_dialog.dart';

class FindPage extends StatefulWidget {
  int startTime; 
  int endTime;
  FindPage({
    Key key
  }):super(key: key) {
    startTime = DateTime.now().millisecondsSinceEpoch;
  }
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin<FindPage>, SingleTickerProviderStateMixin {
  String _platformVersion = 'Unknown';
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('初始化发现页');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.endTime = DateTime.now().millisecondsSinceEpoch;
      int timeSpend = widget.endTime - widget.startTime;
      print("Page render time:${timeSpend} ms");
    });
    // throw StateError('This is a Dart exception.');
    FlutterBugly.init(
      androidAppId: "879293ab21",
      iOSAppId: "879293ab21",
    ).then((_result) {
      setState(() {
        _platformVersion = _result.message;
        print(_result.appId);
      });
    });
    FlutterBugly.setUserId("user id");
    FlutterBugly.putUserData(key: "key", value: "value");
    int tag = 9527;
    FlutterBugly.setUserTag(tag);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('发现页'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('121212')
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('add'),
        onPressed: () {
          throw StateError('This is a Dart exception.');
          // Future.delayed(Duration(seconds: 1)) .then((e) => throw StateError('This is a Dart exception in Future.'));
        }
      ),
    );
  }
}