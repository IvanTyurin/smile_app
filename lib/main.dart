import 'package:flutter/material.dart';
import 'SmileButton.dart';
import 'RadioSmileButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom view',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom view"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SmileButton(
              imagePath: "assets/happy.png",
              buttonSize: 100,
              title: "My btn",
              onTap: (state) {
                print(state);
              },
            ),
            RadioSmileButton(
              count: 3,
              buttonSize: 80,
              titles: ["First", "Second", "Third"],
              imagesPaths: ["assets/happy.png", "assets/happy.png", "assets/happy.png"],
              onChanged: (state, index) {
                print("Button # $index, in state $state");
              },
            ),
          ],
        ),
      ),
    );
  }
}
