import 'package:flutter/material.dart';
import 'package:property_match/models/tab_info.dart';

class InfoHeldByApiModel extends ChangeNotifier {
  InfoHeldByApiModel() {
    // init();
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
    infoMap = {
      'Cleveland': TabInfo('Cleveland', {
        'damage to property due to storm events in 2019': '25.719M cases',
        'annual violent crime data reported per capita': '6203 cases',
        'annual violent crime data cleared per capita': '961 cases',
        'annual property crime data reported per capita': '17057 cases',
        'annual property crime data cleared per capita': '526 cases',
        'population': '381,009',
      }),
      'Columbus': TabInfo('Columbus', {
        'damage to property due to storm events in 2019': '178.8K cases',
        'annual violent crime data reported per capita': '5350 cases',
        'annual violent crime data cleared per capita': '795 cases',
        'annual property crime data reported per capita': '29974 cases',
        'annual property crime data cleared per capita': '1240 cases',
        'population': '898,553',
      }),
      'Cincinnati': TabInfo('Cincinnati', {
        'damage to property due to storm events in 2019': '346.2K cases',
        'annual violent crime data reported per capita': '2824 cases',
        'annual violent crime data cleared per capita': '1229 cases',
        'annual property crime data reported per capita': '13051 cases',
        'annual property crime data cleared per capita': '2362 cases',
        'population': '303,940',
      }),
      'Toledo': TabInfo('Toledo', {
        'damage to property due to storm events in 2019': '15.37M cases',
        'annual violent crime data reported per capita': '2784 cases',
        'annual violent crime data cleared per capita': '846 cases',
        'annual property crime data reported per capita': '9470 cases',
        'annual property crime data cleared per capita': '885 cases',
        'population': '272,779',
      }),
      'Dayton': TabInfo('Dayton', {
        'damage to property due to storm events in 2019': '61.8K cases',
        'annual violent crime data reported per capita': '1519 cases',
        'annual violent crime data cleared per capita': '558 cases',
        'annual property crime data reported per capita': '5673 cases',
        'annual property crime data cleared per capita': '584 cases',
        'population': '140,407',
      })
    };
  }

  Map<String, TabInfo> infoMap = Map<String, TabInfo>();

  void init() async {
    // File read = new File('data.txt');
    // String futureContent = await read.readAsString();
    // Map valueMap = json.decode();
    // print(valueMap.toString);
  }
}
