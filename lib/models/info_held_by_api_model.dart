import 'package:flutter/material.dart';
import 'package:property_match/models/tab_info.dart';
import 'dart:io';
import 'dart:convert';

class InfoHeldByApiModel extends ChangeNotifier {
  InfoHeldByApiModel() {
    File read = new File('./PropertyMatch/API End/data.txt');
    Future<String> futureContent = read.readAsString();
    Map valueMap = json.decode(value);
    print(valueMap.toString);
    // infoMap = {
    //   'Cleveland': TabInfo(
    //     'Cleveland',
    //     {'Crime rate': "4.0"},
    //   ),
    //   'Columbus': TabInfo(
    //     'Columbus',
    //     {'Crime rate': "3.0"},
    //   ),
    //   'Toledo': TabInfo(
    //     'Toledo',
    //     {'Crime rate': "5.0"},
    //   ),
    // };
  }

  Map<String, TabInfo> infoMap = Map<String, TabInfo>();
}
