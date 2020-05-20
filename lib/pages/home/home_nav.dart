import 'package:flutter/material.dart';

import 'package:data_analysis/utils/toast_util.dart';
import 'package:data_analysis/style/resources.dart';
import 'package:data_analysis/widgets/load_image.dart';

import 'package:data_analysis/pages/home/index.dart';
import 'package:data_analysis/pages/find/find_page.dart';
import 'package:data_analysis/pages/mine/mine_page.dart';
import 'package:data_analysis/api/fetch-api.dart';

class HomeBottomNav extends StatefulWidget {
  @override
  _HomeBottomNavState createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  var _pageList;
  var _tabImages;
  var _appBarTitles = ['数据', '发现', '我的'];
  int _currentIndex = 0;
  final _pageController = PageController();
  DateTime  _lastTime;

  List<BottomNavigationBarItem> _list;

  @override
  void initState() {
    super.initState();
    _initData();
    // _fetchData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  void _fetchData() async {
    var res = await httpManager.netFetch('aqsea.product.item.search', {
      'cat_id': 12121
    }, null, null);
    print(res);
  }


  void _initData() {
    _pageList = [
      HomePage(),
      FindPage(),
      MinePage(),
    ];
    _tabImages = [
      [
        const LoadAssetImage("home/home1", width: 21, height: 21),
        const LoadAssetImage("home/home1_active", width: 21, height: 21),
      ],
      [
        const LoadAssetImage("home/category1", width: 21, height: 21),
        const LoadAssetImage("home/category1_active", width: 21, height: 21),
      ],
      [
        const LoadAssetImage("home/mine1", width: 21, height: 21),
        const LoadAssetImage("home/mine1_active", width: 21, height: 21),
      ],
    ];
    
  }

  Future<bool> onWillPop() {
    if (_lastTime == null || DateTime.now().difference(_lastTime) > Duration(milliseconds: 2500)) {
      _lastTime = DateTime.now();
      showShortToast('再点一次退出');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    _list = List.generate(3, (index) {
      LinearGradient getGradient = LinearGradient(colors: [Color(0xFF999999), Color(0xFF999999)]);
      if (_currentIndex == index) {
        getGradient = LinearGradient(colors: [Color(0xFF3133F4), 	Color(0xFFFE4987)]);
      }
      return BottomNavigationBarItem(
        icon: _tabImages[index][0],
        activeIcon: _tabImages[index][1],
        title: Container(
          padding: EdgeInsets.only(top: 3),
          child: GradientText(
            _appBarTitles[index],
            gradient: getGradient,
            style: TextStyle(
              fontSize: 11.0,
            ),
          ),
        )
      );
    });
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: _list,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          elevation: 5.0,
          iconSize: 21.0,
          selectedFontSize: Dimens.font_sp10,
          unselectedFontSize: Dimens.font_sp10,
          selectedItemColor: Color(0xFFFE4987),
          unselectedItemColor: Color(0xffbfbfbf),
          onTap: (index){
            _pageController.jumpToPage(index);
          },
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _pageList,
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
        )
      ),
    );
  }

  void _onPageChanged(int index) {
    // provider.value = index;
    setState(() {
      _currentIndex = index;
    });
  }
}