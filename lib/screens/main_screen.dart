import 'package:flutter/material.dart';
import 'package:property_match/models/sub_menu_utils.dart';
import 'package:property_match/screens/sub_menu_screen.dart';
import 'package:property_match/widgets/select_button.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void navigateToSubMenu(SubMenuType subMenuType) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SubMenuScreen(
              subMenuType: subMenuType,
            );
          },
        ),
      );
    }

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectButton(
            label: 'Search',
            bgColor: Colors.blue[600],
            navigate: () {
              navigateToSubMenu(SubMenuType.search);
            },
          ),
          SelectButton(
            label: 'View',
            bgColor: Colors.blue[600],
            navigate: () {
              navigateToSubMenu(SubMenuType.view);
            },
          ),
          SelectButton(
            label: 'Compare',
            bgColor: Colors.blue[600],
            navigate: () {
              navigateToSubMenu(SubMenuType.compare);
            },
          )
        ],
      ),
    );
  }
}
