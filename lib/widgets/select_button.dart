import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key key,
    this.navigate,
    this.label,
    this.bgColor,
  }) : super(key: key);
  final Function navigate;
  final String label;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: navigate,
        child: Container(
          height: 150,
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
      ),
    );
  }
}
