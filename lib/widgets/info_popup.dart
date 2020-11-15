import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_match/models/info_held_by_api_model.dart';
import 'package:property_match/models/info_held_by_user_model.dart';
import 'package:property_match/models/sub_menu_utils.dart';
import 'package:provider/provider.dart';

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
                children: [
                  Text(
                    key,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 10),
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
                children: [
                  Text(
                    key,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            );
          },
        );
      }

      return infoFromModel;
    }

    void goBack() {
      Navigator.pop(
        context,
      );
    }

    return AlertDialog(
      title: Text(id),
      content: Column(
        children: [
          Container(
            width: 300,
            height: 450,
            child: ListView(
              children: info(),
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
