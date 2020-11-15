import 'package:flutter/foundation.dart';
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

    void addToUserMap(String id, TabInfo tabInfo) {
      infoHeldByUserModel.addToUserMap(id, tabInfo);
    }

    void switchIsInCompareMap(String id) {
      if (infoHeldByUserModel.compareMap.length < 2)
        infoHeldByUserModel.switchInToOrOutOfCompareMap(id);
      if (infoHeldByUserModel.compareMap.length == 2) {
        showDialog(
          context: context,
          builder: (_) => InfoPopUp(subMenuType: subMenuType),
        );
      }
    }

    void removeItemFromMap(String id) {
      infoHeldByUserModel.removeItemFromMap(id);
    }

    IconData iconForMapType([String id]) {
      switch (subMenuType) {
        case SubMenuType.search:
          return Icons.add_rounded;
          break;
        case SubMenuType.view:
          return Icons.remove_rounded;
          break;
        case SubMenuType.compare:
          return infoHeldByUserModel.compareMap.containsKey(id)
              ? Icons.add_box
              : Icons.add_box_outlined;
          break;
        default:
          return Icons.error;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  switch (subMenuType) {
                    case SubMenuType.search:
                      addToUserMap(id, tabInfo);
                      break;
                    case SubMenuType.view:
                      removeItemFromMap(id);
                      break;
                    case SubMenuType.compare:
                      switchIsInCompareMap(id);
                      break;
                    default:
                  }
                },
                child: Icon(
                  iconForMapType(
                      subMenuType == SubMenuType.compare ? id : null),
                ),
                highlightColor: Colors.grey[700],
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
