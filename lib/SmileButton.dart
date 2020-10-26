import 'package:flutter/material.dart';

class SmileButton extends StatefulWidget {
  final double buttonSize;
  final String title;
  final Color filColor;
  final Color activeColor;
  final Color accentColor;
  final bool isEnabled;

  final void Function(bool state) onTap;

  SmileButton({
    Key key,
    this.buttonSize,
    this.title,
    this.accentColor,
    this.filColor,
    this.activeColor,
    this.onTap,
    @required this.isEnabled
  }) : super(key: key);
  
  @override
  _SmileButtonState createState() {
    return _SmileButtonState();
  }
}

class _SmileButtonState extends State<SmileButton> {
  bool onTaped = false;

  String _buttonTitle;
  double _trueButtonSize;
  Color _buttonFilColor;
  Color _buttonAccentColor;

  @override
  Widget build(BuildContext context) {
    _buttonSetup();

    return Container(
      child: GestureDetector(
        onTap: _onButtonTap,
        child: ClipOval(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.all(Radius.circular((_trueButtonSize+4)/2))
            ),
            child: ClipOval(
              child: _buttonBodyBuilder(),
            ),
          )
        ),
      )
    );
  }

  Widget _buttonBodyBuilder() {
    return Container(
      color: _buttonFilColor,
      height: _trueButtonSize,
      width: _trueButtonSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: _trueButtonSize/3,
            ),
            child: Image(
              image: AssetImage('assets/happy.png'),
              height: _trueButtonSize/3,
              color: _buttonAccentColor,
            ),
            alignment: Alignment.bottomCenter,
          ),
          Container(
            height: 16,
            child: Text(
              '$_buttonTitle',
              style: TextStyle(
                  color: _buttonAccentColor
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: _trueButtonSize/4
            ),
            child: ClipOval(
              child: Container(
                width: _trueButtonSize/2.5,
                height: _trueButtonSize/7,
                color: _buttonAccentColor,
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  void _buttonSetup() {
    (widget.buttonSize > 60) ? _trueButtonSize = widget.buttonSize : _trueButtonSize = 60;
    (widget.title != null) ? _buttonTitle = widget.title : _buttonTitle = "";
    (widget.filColor != null) ? _buttonFilColor = widget.filColor : _buttonFilColor = Colors.lightGreenAccent.shade700;
    (widget.accentColor != null) ? _buttonAccentColor = widget.accentColor : _buttonAccentColor = Colors.red.shade900;
    if(onTaped) {
      (widget.accentColor != null) ? _buttonAccentColor = widget.accentColor : _buttonAccentColor = Colors.white70;
    } else {
      (widget.accentColor != null) ? _buttonAccentColor = widget.accentColor : _buttonAccentColor = Colors.red.shade900;
    }
  }

  void _onButtonTap() {
    onTaped = !onTaped;
    setState(() {
      _buttonSetup();
    });
    if(widget.onTap != null) widget.onTap(onTaped);
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