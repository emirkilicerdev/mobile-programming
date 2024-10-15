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
  bool _isBackgroundColorChanged = false;
  bool _isIconColorChanged = false;

  void _changeBackgroundColor() {
    setState(() {
      _isBackgroundColorChanged = !_isBackgroundColorChanged;
      _backgroundColor = _isBackgroundColorChanged
          ? Color.fromRGBO(0, 39, 73, 1)
          : Color.fromRGBO(255, 239, 0, 1);
    });
  }

  void _changeIconColor() {
    setState(() {
      _isIconColorChanged = !_isIconColorChanged;
      _iconColor = _isIconColorChanged
          ? Color.fromRGBO(255, 239, 0, 1)
          : Color.fromRGBO(0, 39, 73, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: _backgroundColor,
          child: Center(
            child: IconButton(
              onPressed: () {
                _changeIconColor();
                _changeBackgroundColor();
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: _iconColor,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}