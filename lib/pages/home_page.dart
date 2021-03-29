import 'package:flutter/material.dart';
import 'package:flutter_in_action/components/index.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter in action'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.markunread_mailbox),
            title: Text("基础组件"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DemoTab()));
            },
          ),
        ],
      ),
    );
  }
}
