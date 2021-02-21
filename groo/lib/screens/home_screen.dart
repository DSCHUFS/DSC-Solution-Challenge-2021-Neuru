import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Groo",
          style: TextStyle(
            color: Color(0xFF2DB400),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.tree), onPressed: null),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
          IconButton(icon: Icon(Icons.person), onPressed: null),
        ],
      ),
    );
  }
}
