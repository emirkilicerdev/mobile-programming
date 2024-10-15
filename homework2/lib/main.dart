import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _backgroundColor = Color.fromRGBO(255, 239, 0, 1);
  Color _iconColor = Color.fromRGBO(0, 39, 73, 1);

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = _backgroundColor == Color.fromRGBO(255, 239, 0, 1)
          ? Color.fromRGBO(0, 39, 73, 1)
          : Color.fromRGBO(255, 239, 0, 1);
    });
  }

  void _changeIconColor() {
    setState(() {
      _iconColor = _iconColor == Color.fromRGBO(0, 39, 73, 1)
          ? Color.fromRGBO(255, 239, 0, 1)
          : Color.fromRGBO(0, 39, 73, 1);
    });
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: _backgroundColor,
          child: Center(
            child: IconButton(
            onPressed: () 
            {_changeIconColor();
            _changeBackgroundColor();},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: _iconColor,
              size: 40,
            ),
          ),
        ),
        )
      ),
    );
  }
}
