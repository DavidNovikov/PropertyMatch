import 'package:flutter/material.dart';
import 'package:property_match/models/info_held_by_user_model.dart';
import 'package:property_match/models/sub_menu_utils.dart';
import 'package:property_match/models/tab_info.dart';
import 'package:provider/provider.dart';

import 'info_popup.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    this.id,
    this.bgColor,
    this.subMenuType,
    this.tabInfo,
  }) : super(key: key);
  final TabInfo tabInfo;
  final String id;
  final Color bgColor;
  final SubMenuType subMenuType;

  @override
  Widget build(BuildContext context) {
    final InfoHeldByUserModel infoHeldByUserModel =
        Provider.of<InfoHeldByUserModel>(context, listen: true);
    final bool isSearch = subMenuType == SubMenuType.search;

    void addToUserMap(String id, TabInfo tabInfo) {
      infoHeldByUserModel.addToUserMap(id, tabInfo);
    }

    void removeItemFromMap(String id) {
      infoHeldByUserModel.removeItemFromMap(id);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: bgColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    id,
                    style: TextStyle(fontSize: 25, color: Colors.grey[900]),
                  ),
                ),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (_) => InfoPopUp(id: id, subMenuType: subMenuType),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  isSearch ? addToUserMap(id, tabInfo) : removeItemFromMap(id),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(isSearch ? Icons.add_rounded : Icons.remove),
              ),
            )
          ],
        ),
      ),
    );
  }
}
