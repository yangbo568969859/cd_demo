import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:data_analysis/model/test_provider.dart';

class TestProvider extends StatefulWidget {
  @override
  _TestProviderState createState()=> _TestProviderState();
}

class _TestProviderState extends State<TestProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TestProvider'),
      // ),
      body: ChangeNotifierProvider.value(
        value: CounterModel(),
        child: MaterialApp(
          home: FirstPage(),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter: ${_counter.counter}')
      ),
      body: Text('Counter: ${_counter.counter}'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Icon(Icons.arrow_forward)
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //使用Consumer来封装counter的读取
      body: Consumer<CounterModel>(
        //builder函数可以直接获取到counter参数
        builder: (context, CounterModel counter, _) => Text('Value: ${counter.counter}')),
      //使用Consumer来封装increment的读取 
      floatingActionButton: Consumer<CounterModel>(
        //builder函数可以直接获取到increment参数
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: TestIcon(),
      ),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CounterModel>(
//       builder: (context, CounterModel counter, _) => Scaffold(
//         appBar: AppBar(
//           title: Text('Counter: ${counter.counter}')
//         ),
//         body: Text('Counter: ${counter.counter}'),
//         floatingActionButton: FloatingActionButton( 
//           onPressed: counter.increment,
//           // child: TestIcon()
//         )
//       ),
//       child: TestIcon(),
//     );
//   }
// }

class TestIcon extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TestIcon build");
    return Icon(Icons.add);
  }
}