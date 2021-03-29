import 'package:flutter/material.dart';

///
/// Flutter Router Study
/// A simple stateless page
///
class NewRouterPage extends StatelessWidget {
  final String title;

  NewRouterPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text("This is a new router page."),
      ),
    );
  }
}
