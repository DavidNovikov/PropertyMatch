import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_match/models/info_held_by_api_model.dart';
import 'package:property_match/models/info_held_by_user_model.dart';
import 'package:property_match/models/sub_menu_utils.dart';
import 'package:property_match/extensions/capitalize.dart';
import 'package:provider/provider.dart';

/*
this class holds a popup for information on an area, it displays different information based on which submenu its from
 */
class InfoPopUp extends StatelessWidget {
  InfoPopUp({this.id, this.subMenuType});
  final SubMenuType subMenuType;
  final String id;

  @override
  Widget build(BuildContext context) {
    final bool isSearch = subMenuType == SubMenuType.search;
    final InfoHeldByUserModel infoHeldByUserModel =
        Provider.of<InfoHeldByUserModel>(context, listen: true);
    final InfoHeldByApiModel infoHeldByApiModel =
        Provider.of<InfoHeldByApiModel>(context, listen: true);
    List<Widget> info() {
      List<Widget> infoFromModel = List<Widget>();
      if (isSearch) {
        infoHeldByApiModel.infoMap[id].info.forEach(
          (key, value) {
            infoFromModel.add(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key.capitalizeFirstLetter() + ':',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          },
        );
      } else {
        infoHeldByUserModel.infoMap[id].info.forEach(
          (key, value) {
            infoFromModel.add(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key.capitalizeFirstLetter() + ':',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          },
        );
      }

      return infoFromModel;
    }

    List<Widget> infoForCompare(String c) {
      List<Widget> infoFromModel = List<Widget>();

      infoHeldByUserModel.infoMap[c].info.forEach(
        (key, value) {
          if (!key.contains('crime'))
            infoFromModel.add(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key.capitalizeFirstLetter() + ':',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
        },
      );

      return infoFromModel;
    }

    List<Widget> compareList() {
      List<Widget> list = List<Widget>();
      infoHeldByUserModel.compareMap.forEach((key, value) {
        list.add(
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 120,
              height: 445,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView(
                  children: infoForCompare(key),
                ),
              ),
            ),
          ),
        );
      });

      return list;
    }

    void goBack() {
      Navigator.pop(
        context,
      );
      infoHeldByUserModel.clearCompareMap();
    }

    List<Widget> textItems() {
      List<Widget> list = List<Widget>();
      infoHeldByUserModel.compareMap.forEach((key, value) {
        list.add(Text(
          key,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ));
      });
      return list;
    }

    Widget titleForCompare() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: textItems(),
        ),
      );
    }

    Widget title() {
      return subMenuType == SubMenuType.compare
          ? titleForCompare()
          : Text(
              id,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            );
    }

    return AlertDialog(
      title: title(),
      content: Column(
        children: [
          Container(
            width: 300,
            height: 445,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: subMenuType == SubMenuType.compare
                  ? Row(children: compareList())
                  : ListView(
                      children: info(),
                    ),
            ),
          ),
          Transform.scale(
            scale: 2,
            child: GestureDetector(
              child: Icon(Icons.close),
              onTap: goBack,
            ),
          ),
        ],
      ),
    );
  }
}
