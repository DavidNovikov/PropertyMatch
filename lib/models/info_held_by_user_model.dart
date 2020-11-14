import 'package:flutter/material.dart';
import 'package:property_match/models/tab_info.dart';

class InfoHeldByUserModel extends ChangeNotifier {
  InfoHeldByUserModel();

  final Map<String, TabInfo> infoMap = Map<String, TabInfo>();

  void addToUserMap(String key, TabInfo newTabInfo) {
    infoMap[key] = newTabInfo;
    notifyListeners();
  }

  void removeItemFromMap(String key) {
    infoMap.remove(key);
    notifyListeners();
  }
}
