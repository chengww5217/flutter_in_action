import 'package:flutter/material.dart';

class EchoWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const EchoWidget(
      {Key key, @required this.text, this.backgroundColor: Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.normal,
              fontSize: 26),
        ),
      ),
    );
  }
}
