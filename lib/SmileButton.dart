import 'package:flutter/material.dart';

class SmileButton extends StatefulWidget {
  final double buttonSize;
  final String title;
  final bool isEnabled;

  SmileButton({
    Key key,
    this.buttonSize,
    this.title,
    @required this.isEnabled
  }) : super(key: key);
  
  @override
  _SmileButtonState createState() {
    return _SmileButtonState();
  }
}

class _SmileButtonState extends State<SmileButton> {
  String _buttonTitle = "";
  double _trueButtonSize = 60;

  @override
  Widget build(BuildContext context) {
    if(widget.buttonSize > 60) _trueButtonSize = widget.buttonSize;
    if(widget.title != null) _buttonTitle = widget.title;

    return Container(
      child: GestureDetector(
        onTap: () { print("Hi!!"); },
        child: ClipOval(
          child: Container(
            color: Colors.green,
            height: _trueButtonSize,
            width: _trueButtonSize,
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                      minHeight: _trueButtonSize/3
                  ),
                  child: Text('$_buttonTitle'),
                  alignment: Alignment.bottomCenter,
                ),
                Text('Second'),
                Text('Third'),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class SmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(100, 100), 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}