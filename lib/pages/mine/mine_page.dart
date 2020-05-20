import 'package:flutter/material.dart';

import 'package:data_analysis/style/resources.dart';
import 'package:data_analysis/route/index.dart';

import 'package:data_analysis/widgets/my_card.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin<MinePage>, SingleTickerProviderStateMixin, WidgetsBindingObserver {
  @override
  bool get wantKeepAlive => true;

  ScrollController _scrollController = ScrollController();
  bool _isShow = false;
  String defaultHeader = 'https://img.aqsea.com/iBuyBuy/wechat/avater/default_shop-avater.png';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);//注册监听器
    print('初始化我的页面');
    _scrollController.addListener(() {
      if (_scrollController.offset < 180 && _isShow) {
        setState(() {
          _isShow = false;
        });
      } else if (_scrollController.offset >= 180 && _isShow == false) {
        setState(() {
          _isShow = true;
        });
      }
    });
  }

  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   print(state);
  //   if (state == AppLifecycleState.resumed) { 
  //     print('AppLifecycleState.resumed');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var toolList = SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      sliver: SliverToBoxAdapter(
        child: MyCard(
          borderRadius: 10,
          child: Column(
            children: <Widget>[
              _StatisticsTitle(title: '我的订单', showMore: true, subTitle: '全部订单'),
              GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                childAspectRatio: 0.9,
                children: <Widget>[
                  _StatisticsOrders(title: '待支付', content: 0, img: 'pay', onPressed: () {}),
                  _StatisticsOrders(title: '待收货', content: 1, img: 'send', onPressed: () {}),
                  _StatisticsOrders(title: '评价有礼', content: 2, img: 'take', onPressed: () {}),
                  _StatisticsOrders(title: '退换/售后', content: 0, img: 'return', onPressed: () {}),
                  _StatisticsOrders(title: '全部订单', content: 0, img: 'all', onPressed: () {}),
                ],
              ),
            ],
          )
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: CustomScrollView(
        controller: _scrollController,
        shrinkWrap: false,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 230,
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            brightness: Brightness.dark,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(400, 14),
                          bottomRight: Radius.elliptical(400, 14)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.03),
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            spreadRadius: 0
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment(0.8, 0.0),
                          // begin: AlignmentGeometry(),
                          colors: [
                            Color(0xFF3133F4),
                            Color(0xFFFE4987),
                          ]
                        )
                        // image: new DecorationImage(
                        //   image: new AssetImage('assets/static/banner-vip.jpg'),
                        //   fit: BoxFit.cover
                        // ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 0,
                      right: 0,
                      height: 50,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 11),
                        child: Column(
                          children: <Widget>[
                            MyCard(
                              borderRadius: 10,
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: <Widget>[
                                          // Image.network('https://oss.suning.com/vss/activity/wximg/my/vip.png', width: 45, height: 30),
                                          Icon(
                                            IconData(0xe74b, fontFamily: 'appfont1'),
                                            size: 20,
                                            color: Color(0xFFFE4987),
                                          ),
                                          Gaps.hGap8,
                                          Text('你有一张双11嗨爆夜门票待领取！', style: TextStyle(fontSize: 11),),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 22,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(42),
                                        border: Border.all(width: 0.6, color: Color(0xFFFE4987))
                                      ),
                                      child: Text('点击领取', style: TextStyle(fontSize: 11, color: Color(0xFFFE4987))),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 55,
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            IconData(0xe757, fontFamily: 'appfont1'),
                            size: 26,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          NavigatorUtils.goSettingPage(context);
                          // RouteUtil.routeToSettingPage(context);
                        },
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 10,
                      child: InkWell(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              // child: Image.asset('assets/pngs/icon_message.png', width: 22, height: 22),
                              child: Icon(
                                IconData(0xe730, fontFamily: 'appfont1'),
                                size: 26,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 3,
                              right: 3,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.red
                                ),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          // RouteUtil.routeToMessagePage(context);
                          // _whetherGoLogin().then((res) {
                          //   if (res == true) {
                          //     RouteUtil.routeToMessagePage(context);
                          //   }
                          // });
                        },
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 22,
                      child: InkWell(
                        onTap: () {
                          // RouteUtil.routeToSettingPage(context);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(75),
                              child: Image.network(defaultHeader, width: 75, height: 75, fit: BoxFit.cover),
                            ),
                            SizedBox(width: 10),
                            Text( '_user.nick', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white))
                          ],
                        ),
                      )
                    ),
                    Positioned(
                      bottom: 65,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                            },
                            child: Column(
                              children: <Widget>[
                                Text('23', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                                Gaps.vGap5,
                                Text('收藏商品', style: TextStyle(fontSize: 12, color: Colors.white))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // });
                            },
                            child: Column(
                              children: <Widget>[
                                Text('22', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                                Gaps.vGap5,
                                Text('关注店铺', style: TextStyle(fontSize: 12, color: Colors.white))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                            },
                            child: Column(
                              children: <Widget>[
                                Text('12', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                                Gaps.vGap5,
                                Text('优惠券', style: TextStyle(fontSize: 12, color: Colors.white))
                              ],
                            )
                          ),
                          InkWell(
                            onTap: () {
                            },
                            child: Column(
                              children: <Widget>[
                                Text('0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                                Gaps.vGap5,
                                Text('浏览记录', style: TextStyle(fontSize: 12, color: Colors.white))
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
          _sizedBox(5),
          toolList,
        ],
      ),
    );
  }

  SliverToBoxAdapter _sizedBox(double height) => SliverToBoxAdapter(
    child: SizedBox(height: height),
  );
}

class _StatisticsTitle extends StatelessWidget {
  const _StatisticsTitle({
    Key key,
    this.title,
    this.showMore = true,
    this.subTitle,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final bool showMore;
  final String subTitle;
  @required
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFf1f1f1),
              width: 0.5
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 1)),
            showMore==true ? Row(
              children: <Widget>[
                Text(subTitle, style: TextStyle(color: Colours.text_gray, fontSize: 12)),
                Gaps.hGap4,
                Icon(
                  IconData(0xe70c, fontFamily: 'appfont1'),
                  size: 14,
                  color: Colours.text_gray,
                )
              ],
            ):Container()
          ],
        ),
      )
    );
  }
}

class _StatisticsOrders extends StatelessWidget {
  const _StatisticsOrders({
    Key key,
    this.title,
    this.content,
    this.img,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final int content;
  final String img;
  @required
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gaps.vGap8,
                Image.asset('assets/images/trade/icon-color-wait_${this.img}.png', width: 25, height: 25),
                Gaps.vGap4,
                Text(title, style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
              ],
            ),
          ),
          content != 0 ? Positioned(
            right: 14,
            top: 14,
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minWidth: 18
              ),
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFFFE4987)),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text('$content', style: TextStyle(color: Color(0xFFFE4987), fontSize: 10)),
            ),
          ): Container()
        ],
      ),
    );
  }
}
