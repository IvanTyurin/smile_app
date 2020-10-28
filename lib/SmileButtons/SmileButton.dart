import 'package:flutter/material.dart';

class SmileButton extends StatefulWidget {
  final double buttonSize;
  final String title;
  final Color filColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color disableColor;
  final bool isEnabled;
  final String imagePath;

  final void Function(bool state) onTap;

  SmileButton(
      {Key key,
      this.buttonSize = 60,
      this.imagePath = "",
      this.title = "",
      this.filColor,
      this.activeColor = Colors.white,
      this.inactiveColor = Colors.red,
      this.disableColor = Colors.pinkAccent,
      this.onTap,
      this.isEnabled = true})
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
    double _borderRadius = (_trueButtonSize + _borderWidth * 2) / 2;

    return Container(
        child: GestureDetector(
      onTap: onButtonTap,
      child: ClipOval(
          child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: _borderWidth,
              color: Colors.grey.shade700,
            ),
            borderRadius: BorderRadius.all(Radius.circular(_borderRadius))),
        child: ClipOval(
          child: buttonBodyBuilder(),
        ),
      )),
    ));
  }

  Widget buttonBodyBuilder() {
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
    double _columnPartHeight = _trueButtonSize / 3;

    return Container(
      constraints: BoxConstraints(
        minHeight: _columnPartHeight,
      ),
      child: Image(
        image: AssetImage('$_pathToImage'),
        height: _columnPartHeight,
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
    double _minHeightConstraint = _trueButtonSize / 4;
    double _shadowWith = _trueButtonSize / 2.5;
    double _shadowHeight = _trueButtonSize / 7;

    return Container(
      constraints: BoxConstraints(minHeight: _minHeightConstraint),
      child: ClipOval(
        child: Container(
          width: _shadowWith,
          height: _shadowHeight,
          color: _buttonAccentColor,
        ),
      ),
      alignment: Alignment.center,
    );
  }

  void _buttonSetup() {
    _pathToImage = widget.imagePath;
    _buttonTitle = widget.title;
    _buttonIsEnabled = widget.isEnabled;

    (widget.buttonSize > 60)
        ? _trueButtonSize = widget.buttonSize
        : _trueButtonSize = 60;

    (widget.filColor != null)
        ? _buttonFilColor = widget.filColor
        : _buttonFilColor = Colors.lightGreenAccent.shade700;

    if (_buttonIsEnabled) {
      if (_onTaped) {
        _buttonAccentColor = widget.activeColor;
      } else {
        _buttonAccentColor = widget.inactiveColor;
      }
    } else {
      _buttonAccentColor = widget.disableColor;
    }
  }

  void onButtonTap() {
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

  void saveState(bool state) {
    _onTaped = state;
    setState(() {
      _buttonSetup();
    });
  }
}
