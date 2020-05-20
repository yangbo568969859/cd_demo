import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:data_analysis/utils/router_util.dart';

import 'package:data_analysis/pages/home/index.dart';
import 'package:data_analysis/pages/attention/index.dart';
import 'package:data_analysis/pages/setting/setting_page.dart';
import 'package:data_analysis/pages/test/test_page.dart';

class NavigatorUtils {
  static goHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return HomePage();
    }));
  }
  static goAttentionPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AttentionPage();
    }));
  }
  static goSettingPage(BuildContext context) {
    Navigator.of(context).push(
      Right2LeftRouter(child: SettingPage())
    );
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return SettingPage();
    // }));
  }

  static goTestPage(BuildContext context) {
    Navigator.of(context).push(
      Right2LeftRouter(child: TestPage())
    );
  }
  static goTest2Page(BuildContext context) {
    Navigator.pushNamed(context,"test_page", arguments: "Hey");
    // Navigator.pushNamed(context,"test_page");
  }
}