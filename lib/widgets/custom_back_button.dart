import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.pop(
        context,
      );
    }

    return GestureDetector(
      onTap: goBack,
      child: Icon(
        Icons.arrow_back_ios_rounded,
        size: 40,
        color: Colors.grey,
      ),
    );
  }
}
