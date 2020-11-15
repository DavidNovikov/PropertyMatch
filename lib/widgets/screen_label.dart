import 'package:flutter/material.dart';

/*
This class labels the top of the page in a submenu
*/
class ScreenLabel extends StatelessWidget {
  const ScreenLabel({Key key, this.label, this.bgColor}) : super(key: key);
  final String label;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8.0,
        left: 8.0,
      ),
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: bgColor),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
