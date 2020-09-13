import 'package:example/bloc_counter.dart';
import 'package:example/bloc_event.dart';
import 'package:example/event.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

// class _HomeState extends State<Home> {
//   BlocCounter _blocCounter;
//   @override
//   void initState() {
//     super.initState();
//     _blocCounter = BlocCounter();
//     _blocCounter.counter.value = 0;
//   }

//   void _incrementCounter() {
//     _blocCounter.counter.value++;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<int>(
//               stream: _blocCounter.counter.stream,
//               builder: (context, snapshot) {
//                 return Text(
//                   snapshot.data.toString(),
//                   style: Theme.of(context).textTheme.headline3,
//                 );
//               },
//             ),
//             StreamBuilder<String>(
//               stream: _blocCounter.numberType,
//               builder: (context, snapshot) {
//                 return Text(
//                   snapshot.data.toString(),
//                   style: Theme.of(context).textTheme.headline3,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

    class _HomeState extends State<Home> {
      BlocEvent _blocEvent;
      int _currentInput;
      @override
      void initState() {
        super.initState();
        _blocEvent = BlocEvent();
        _currentInput = 0;
      }

      void _increaseInputAndCalculate() {
        _blocEvent.input.value = _currentInput;
        _currentInput++;
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<int>(
                  stream: _blocEvent.input.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return SizedBox();
                    return Text(
                      "Input value: " + snapshot.data.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                Container(
                  height: 120,
                  padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  child: StreamBuilder<Event>(
                    stream: _blocEvent.event,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false)
                        return SizedBox(
                          height: 30,
                        );
                      return Text(
                        snapshot.data.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: _increaseInputAndCalculate,
                  child: Text('Increase input and get an even number'),
                ),
              ],
            ),
          ),
        );
      }
    }
