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
                child: ScreenLabel(
                  label: SubMenuUtils.namesOfMenus[subMenuType],
                  bgColor: Colors.blue[600],
                ),
              ),
            ],
          ),
          Column(
            children: subMenuType == SubMenuType.search
                ? searchItems(infoHeldByApiModel)
                : viewItems(infoHeldByUserModel),
          )
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
}
