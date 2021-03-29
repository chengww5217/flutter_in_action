import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;
  final Color color;

  IconTextButton(this.icon, this.text, this.onTap, {this.color = Colors.grey});

  @override
  State<StatefulWidget> createState() {
    return _IconTextButtonState();
  }
}

class _IconTextButtonState extends State<IconTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              color: widget.color,
              size: 14,
            ),
            Padding(padding: EdgeInsets.only(left: 6)),
            Text(
              widget.text,
              style: TextStyle(color: widget.color),
            )
          ],
        ),
      ),
    );
  }
}
