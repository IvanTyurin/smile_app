import 'package:flutter/material.dart';
import 'SmileButton.dart';

class RadioSmileButton extends StatefulWidget {
  final List<SmileButton> buttonsList;

  const RadioSmileButton({Key key, this.buttonsList}) : super(key: key);

  _RadioSmileButtonState createState() {
    return _RadioSmileButtonState();
  }
}

class _RadioSmileButtonState extends State<RadioSmileButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: _arrayButtonsBuild(),
    );
  }

  List<Widget> _arrayButtonsBuild() {
    List<Widget> buttons = [];
    for(SmileButton button in widget.buttonsList) {
      buttons.add(Container(
        child: button,
      ));
    }
    return buttons;
  }
}