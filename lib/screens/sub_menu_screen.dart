import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:property_match/models/info_held_by_api_model.dart';
import 'package:property_match/models/info_held_by_user_model.dart';
import 'package:property_match/models/sub_menu_utils.dart';
import 'package:property_match/models/tab_info.dart';
import 'package:property_match/widgets/custom_back_button.dart';
import 'package:property_match/widgets/list_item.dart';
import 'package:property_match/widgets/screen_label.dart';
import 'package:provider/provider.dart';

class SubMenuScreen extends StatelessWidget {
  const SubMenuScreen({
    Key key,
    this.subMenuType,
  }) : super(key: key);
  final SubMenuType subMenuType;

  @override
  Widget build(BuildContext context) {
    final bool isSearch = subMenuType == SubMenuType.search;
    final InfoHeldByUserModel infoHeldByUserModel =
        Provider.of<InfoHeldByUserModel>(context, listen: true);
    final InfoHeldByApiModel infoHeldByApiModel =
        Provider.of<InfoHeldByApiModel>(context, listen: true);
    return Material(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBackButton(),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Container(
                  color: Colors.white,
                  child: ScreenLabel(
                    label: SubMenuUtils.namesOfMenus[subMenuType],
                    bgColor: Colors.blue[600],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                instructionText(
                    subMenuType: subMenuType,
                    isEmpty: !isSearch && infoHeldByUserModel.infoMap.isEmpty),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 450,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: ListView.builder(
                itemCount: isSearch
                    ? searchItems(infoHeldByApiModel).length
                    : viewItems(infoHeldByUserModel).length,
                itemBuilder: (BuildContext context, int index) {
                  return isSearch
                      ? searchItems(infoHeldByApiModel)[index]
                      : viewItems(infoHeldByUserModel)[index];
                },
              ),
            ),
          ),
          Container(width: 300, height: 50, color: Colors.white)
        ],
      ),
    );
  }

  List<Widget> searchItems(InfoHeldByApiModel infoHeldByApiModel) {
    List<Widget> list = List<Widget>();
    infoHeldByApiModel.infoMap.forEach(
      (key, value) {
        list.add(
          ListItem(
            id: key,
            bgColor: Colors.grey,
            subMenuType: subMenuType,
            tabInfo: TabInfo(key, value.info),
          ),
        );
      },
    );
    return list;
  }

  List<Widget> viewItems(InfoHeldByUserModel infoHeldByUserModel) {
    List<Widget> list = List<Widget>();
    infoHeldByUserModel.infoMap.forEach(
      (key, value) {
        list.add(
          ListItem(
            id: key,
            bgColor: Colors.grey,
            subMenuType: subMenuType,
            tabInfo: TabInfo(key, value.info),
          ),
        );
      },
    );
    return list;
  }

  String instructionText({SubMenuType subMenuType, bool isEmpty}) {
    if (isEmpty) return 'Please go to the view screen to pick areas';
    switch (subMenuType) {
      case SubMenuType.search:
        return 'Please select the areas you\'re interested in\nTap on an area to view its details';
        break;
      case SubMenuType.view:
        return 'Tap on an area to view its details';
        break;
      case SubMenuType.compare:
        return 'Please select twe areas to compare\n Tap on an area to view it';
        break;
      default:
        return '';
    }
  }
}
