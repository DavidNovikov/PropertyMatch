import 'package:flutter/material.dart';
import 'package:property_match/models/tab_info.dart';

class InfoHeldByApiModel extends ChangeNotifier {
  InfoHeldByApiModel() {
    infoMap = {
      'Cleveland': TabInfo(
        'Cleveland',
        {'Crime rate': "4.0"},
      ),
      'Columbus': TabInfo(
        'Columbus',
        {'Crime rate': "3.0"},
      ),
      'Toledo': TabInfo(
        'Toledo',
        {'Crime rate': "5.0"},
      ),
    };
  }

  Map<String, TabInfo> infoMap = Map<String, TabInfo>();
}
