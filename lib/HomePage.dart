import 'package:flutter/material.dart';
import 'SmileButton.dart';
import 'RadioSmileButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              isEnabled: false,
              onTap: (state) {},
            ),
            RadioSmileButton(
              count: 3,
              buttonSize: 80,
              titles: ["First", "Second", "Third"],
              imagesPaths: [
                "assets/happy.png",
                "assets/happy.png",
                "assets/happy.png"
              ],
              onChanged: (state, index) {
                print("Button # $index, in state $state");
              },
            ),
            FlatButton()
          ],
        ),
      ),
    );
  }
}
