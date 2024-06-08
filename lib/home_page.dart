import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  static const platform = MethodChannel('flavor_channel');

  @override
  void initState() {
    super.initState();

    // platform.setMethodCallHandler(invokedMethods);
  }

  // invokedMethods(MethodCall methodCall) async {
  //   switch (methodCall.method) {
  //     case "openCaller":
  //       print("arrived to open caller");
  //   // Navigator.pushNamed(context, "/ring");
  //
  //   }
  // }

  //final flavor =  platform.invokeMethod("getFlavor");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<dynamic>(
              future: platform.invokeMethod("getFlavor"),
              builder: (contexts, snap) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("You are running '${snap.data}' build" ?? "hhi"),
                );
              }),
          Expanded(child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),)

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
