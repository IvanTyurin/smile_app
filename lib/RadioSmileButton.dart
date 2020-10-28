import 'package:flutter/material.dart';
import 'SmileButton.dart';

class RadioSmileButton extends StatefulWidget {
  final int count;
  final double buttonSize;
  final Color filColor;
  final Color activeColor;
  final Color accentColor;
  final bool isEnabled;
  final List<String> titles;
  final List<String> imagesPaths;

  final void Function(bool state, int index) onChanged;

  const RadioSmileButton({
    Key key,
    this.buttonSize,
    this.titles,
    this.filColor,
    this.activeColor,
    this.accentColor,
    this.isEnabled,
    this.imagesPaths,
    this.onChanged,
    this.count,
  }) : super(key: key);

  _RadioSmileButtonState createState() {
    return _RadioSmileButtonState();
  }
}

class _RadioSmileButtonState extends State<RadioSmileButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: _radioButtonsBuild(),
    );
  }

  List<Widget> _radioButtonsBuild() {
    List<Widget> buttons = [];
    List<GlobalKey> _buttonsKeys = [];

    if (widget.count == widget.titles.length &&
        widget.count == widget.imagesPaths.length) {
      for (int i = 0; i < widget.count; i++) {
        GlobalKey _buttonKey = new GlobalKey();

        _buttonsKeys.add(_buttonKey);
        buttons.add(Container(
          child: SmileButton(
              key: _buttonKey,
              imagePath: widget.imagesPaths[i],
              buttonSize: widget.buttonSize,
              title: widget.titles[i],
              onTap: (state) {
                int index = i;
                if (!state) {
                  (_buttonsKeys[i].currentState as SmileButtonState)
                      .saveState(!state);
                }
                for (int j = 0; j < widget.count; j++) {
                  if (j != i) {
                    (_buttonsKeys[j].currentState as SmileButtonState)
                        .disable();
                  }
                }
                widget.onChanged(state, index);
              }),
        ));
      }
    }

    return buttons;
  }
}
