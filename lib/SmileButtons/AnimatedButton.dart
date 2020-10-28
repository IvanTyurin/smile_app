import 'package:flutter/material.dart';
import 'SmileButton.dart';

class AnimatedButton extends SmileButton {
  AnimatedButton(
      {Key key,
      double buttonSize,
      Color filColor,
      void Function(bool state) onTap,
      bool isEnabled = true})
      : super(
          key: key,
          buttonSize: buttonSize,
          filColor: filColor,
          onTap: onTap,
        );

  @override
  AnimatedButtonState createState() {
    return AnimatedButtonState();
  }
}

class AnimatedButtonState extends SmileButtonState {
  double _trueButtonSize;

  @override
  Widget buttonBodyBuilder() {
    return Container(
      color: Colors.amberAccent,
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Eyes'),
          Text('Space'),
          Text('Mouth'),
        ],
      ),
    );
  }

  @override
  void onButtonTap() {
    print('Tapped!');
  }
}
