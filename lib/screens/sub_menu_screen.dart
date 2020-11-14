import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                ? searchItems()
                : viewItems(infoHeldByUserModel),
          )
        ],
      ),
    );
  }

  List<Widget> searchItems() {
    return [
      ListItem(
        id: 'Cleveland',
        bgColor: Colors.grey,
        subMenuType: subMenuType,
        tabInfo: TabInfo('Cleveland', 4.0),
      ),
      ListItem(
        id: 'Columbus',
        bgColor: Colors.grey,
        subMenuType: subMenuType,
        tabInfo: TabInfo('Columbus', 4.0),
      ),
      ListItem(
        id: 'Toledo',
        bgColor: Colors.grey,
        subMenuType: subMenuType,
        tabInfo: TabInfo('Toledo', 4.0),
      ),
    ];
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
            tabInfo: TabInfo(key, 4.0),
          ),
        );
      },
    );
    return list;
  }
}
