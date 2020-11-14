import 'package:flutter/material.dart';
import 'package:property_match/models/sub_menu_utils.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    Key key,
    this.id,
    this.bgColor,
    this.subMenuType,
  }) : super(key: key);
  final SubMenuType subMenuType;
  final String id;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
