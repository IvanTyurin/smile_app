import 'package:flutter/material.dart';

class SmileButton extends StatefulWidget {
  final double buttonSize;
  final String title;
  final Color filColor;
  final Color activeColor;
  final Color accentColor;
  final bool isEnabled;
  final String imagePath;

  final void Function(bool state) onTap;


  SmileButton(
      {Key key,
      this.buttonSize,
      this.imagePath,
      this.title,
      this.accentColor,
      this.filColor,
      this.activeColor,
      this.onTap,
      this.isEnabled})
      : super(key: key);

  @override
  SmileButtonState createState() {
    return SmileButtonState();
  }
}

class SmileButtonState extends State<SmileButton> {
  double _borderWidth = 2.0;
  bool _onTaped = false;
  bool _buttonIsEnabled;

  String _buttonTitle;
  String _pathToImage;
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
              width: _borderWidth,
              color: Colors.grey.shade700,
            ),
            borderRadius:
                BorderRadius.all(Radius.circular((_trueButtonSize + _borderWidth * 2) / 2))),
        child: ClipOval(
          child: _buttonBodyBuilder(),
        ),
      )),
    ));
  }

  Widget _buttonBodyBuilder() {
    return Container(
      color: _buttonFilColor,
      height: _trueButtonSize,
      width: _trueButtonSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildImage(),
          _buildTitle(),
          _buildShadow(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      constraints: BoxConstraints(
        minHeight: _trueButtonSize / 3,
      ),
      child: Image(
        image: AssetImage('$_pathToImage'),
        height: _trueButtonSize / 3,
        color: _buttonAccentColor,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 16,
      child: Text(
        '$_buttonTitle',
        style: TextStyle(color: _buttonAccentColor),
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildShadow() {
    return Container(
      constraints: BoxConstraints(minHeight: _trueButtonSize / 4),
      child: ClipOval(
        child: Container(
          width: _trueButtonSize / 2.5,
          height: _trueButtonSize / 7,
          color: _buttonAccentColor,
        ),
      ),
      alignment: Alignment.center,
    );
  }

  void _buttonSetup() {
    (widget.isEnabled == null || widget.isEnabled == true)
        ? _buttonIsEnabled = true
        : _buttonIsEnabled = false;

    (widget.buttonSize > 60)
        ? _trueButtonSize = widget.buttonSize
        : _trueButtonSize = 60;
    (widget.title != null) ? _buttonTitle = widget.title : _buttonTitle = "";
    (widget.filColor != null)
        ? _buttonFilColor = widget.filColor
        : _buttonFilColor = Colors.lightGreenAccent.shade700;
    (widget.imagePath != null)
        ? _pathToImage = widget.imagePath
        : _pathToImage = "";

    if (_buttonIsEnabled) {
      if (_onTaped) {
        (widget.accentColor != null)
            ? _buttonAccentColor = widget.accentColor
            : _buttonAccentColor = Colors.white;
      } else {
        (widget.accentColor != null)
            ? _buttonAccentColor = widget.accentColor
            : _buttonAccentColor = Colors.red.shade900;
      }
    } else {
      (widget.accentColor != null)
          ? _buttonAccentColor = widget.accentColor
          : _buttonAccentColor = Colors.pinkAccent.shade100;
    }
  }

  void _onButtonTap() {
    if (_buttonIsEnabled) {
      _onTaped = !_onTaped;
      setState(() {
        _buttonSetup();
      });
      if (widget.onTap != null) widget.onTap(_onTaped);
    }
  }

  void disable() {
    if (_onTaped) {
      _onTaped = false;
      setState(() {
        _buttonSetup();
      });
    }
  }
}
