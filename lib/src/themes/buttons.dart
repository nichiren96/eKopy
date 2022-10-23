import 'package:flutter/material.dart';

ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    primary: Colors.deepPurple);

ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    primary: Colors.deepPurple.shade300);

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function onPressed;
  final ButtonStyle style;

  Button.primary(this.text, this.onPressed, {this.icon})
      : style = primaryButtonStyle;

  Button.secondary(this.text, this.onPressed, {this.icon})
      : style = secondaryButtonStyle;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? ElevatedButton.icon(
            style: style,
            onPressed: () => onPressed(),
            icon: Icon(icon),
            label: Text(text))
        : ElevatedButton(
            onPressed: () => onPressed(), style: style, child: Text(text));
  }
}
