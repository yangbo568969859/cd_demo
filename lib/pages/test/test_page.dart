import 'dart:async';

import 'package:data_analysis/pages/test/test_flutter_map.dart';
import 'package:data_analysis/pages/test/test_wall_page.dart';
import 'package:data_analysis/pages/test/test_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  // String _msg = "通知：";
  AnimationController controller;
  Animation<double> animation;

  @override
  initState() {
    super.initState();
    // controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    // animation = Tween(begin: 50.0, end: 200.0).animate(controller);
    // controller.forward();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeInCirc);
    controller.repeat(reverse: true);
    animation = Tween(begin: 50.0, end: 200.0).animate(curve)
    // ..addListener(() {
    //   print('12121');
    //   setState(() {});
    // })
    ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed){
          controller.forward();
        }
    });
    controller.forward();

    Future(() => print('f1'));
    Future f1 = Future(() => null);
    Future(() => print('f2')).then((value) {
      print('f3');
      scheduleMicrotask(() => print('f4'));
    }).then((_) => print('f5'));
    Future(() => print('f6')).then((_) => Future(() => print('f7'))).then((_) => print('f8'));
    Future(() => print('f9'));
    f1.then((value) => print('f10'));
    scheduleMicrotask(() => print('f11'));
    print('f12');
  }
  @override
  void dispose() { 
    controller.dispose(); // 释放资源
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$msg'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.code),
            tooltip: '回到首页哦',
            onPressed: () => {
              Navigator.pushNamedAndRemoveUntil(context,'home', ModalRoute.withName('test_page'))
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        // child: RawGestureDetector(
        //   gestures: {
        //     MultipleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<MultipleTapGestureRecognizer>(
        //       () => MultipleTapGestureRecognizer(), 
        //       (MultipleTapGestureRecognizer instance) {
        //         instance.onTap = () => print('Parent1 onTap');
        //       }
        //     )
        //   },
        //   child: Container(
        //     color: Colors.pink,
        //     child: Center(
        //       child: Container(
        //         child: GestureDetector(
        //           onTap: () => print('child on tap'),
        //           child: Container(
        //           color: Colors.blueAccent,
        //             width: 200,
        //             height: 200,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
        // child: GestureDetector(
        //   onTap: () {
        //     print('Parent onTap');
        //   },
        //   child: Container(
        //     color: Colors.pinkAccent,
        //     child: Center(
        //       child: GestureDetector(
        //         onTap: () {
        //           print('Child onTAP');
        //         },
        //         child: Container(
        //           color: Colors.blueAccent,
        //           width: 200,
        //           height: 200,
        //         ),
        //       ),
        //     )
        //   ),
        // ),

        // child: NotificationListener<CustomNotification>(
        //   child: Column(
        //     children: <Widget>[
        //       Text(_msg),
        //       CustomChild(),
        //     ],
        //   ),
        //   onNotification: (notification) {
        //     setState(() {
        //       _msg += notification.msg+" ";
        //     });
        //     return true;
        //   },
        // )
        // child: AnimatedLogo(animation: animation)
        // child: Center(
        //   child: AnimatedBuilder(animation: animation, builder: (context, child) => Container(
        //     width: animation.value,
        //     height: animation.value,
        //     color: Colors.pinkAccent,
        //     child: child,
        //   ), child: Text('1212'),),
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: 'hero',
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.pink,
                  // child: Text('12121'),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Page2()));
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestWallPage()));
              },
              child: Container(
                child: Text('进入照片墙')
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestProvider()));
              },
              child: Container(
                child: Text('Provider')
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => TestFlutterMap()));
              },
              child: Container(
                child: Text('Flutter map')
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 定义了一个继承自点击手势识别器 TapGestureRecognizer 的类，并重写了其 rejectGesture 方法，手动地把自己又复活了
class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

// class CountContainer extends InheritedWidget {
//   static CountContainer of(BuildContext context) => context.dependOnInheritedWidgetOfExactType as CountContainer;
//   final int count;
//   CountContainer({ Key key, @required this.count, @required Widget child, }): super(key: key, child: child);
//   // 判断是否需要更新 
//   @override bool updateShouldNotify(CountContainer oldWidget) => count != oldWidget.count;
// }

class CustomNotification extends Notification {
  CustomNotification(this.msg);
  final String msg;
}

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: () {
      CustomNotification('hello').dispatch(context);
    },
    child: Text('点击'),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({
    Key key,
    Animation<double> animation
  }):super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        color: Colors.black,
        width: animation.value,
        height: animation.value,
        child: Text('hahaha'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hero PAGE'),
        centerTitle: true,
      ),
      body: Hero(
        tag: 'hero',
        child: Container(
          width: 300,
          height: 300,
          color: Colors.orange,
          // child: Text('hahaha'),
        ),
      ),
    );
  }
}