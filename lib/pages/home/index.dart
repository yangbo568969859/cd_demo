// import 'package:data_analysis/utils/screen_util.dart';
import 'package:data_analysis/widgets/my_card.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:data_analysis/pages/';
// import 'package:data_analysis/route/index.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:data_analysis/widgets/indicator.dart';
// import 'package:data_analysis/utils/toast_util.dart';

import 'package:data_analysis/style/resources.dart';

class InitColors {
  Color color;
  Color color2;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  int touchedIndex;
  ScrollController _scrollController = ScrollController();
  bool _isShow = false;
  List<Color> _bgcolors = [
    Color(0xFFFDF1F1),
    Color(0xFFF1F8F4),
    Color(0xFFF3F6F8),
    Color(0xFFFDF1F1),
    Color(0xFFFAF2F6),
    Color(0xFFFCF4F0),
  ];
  List<Color> _textcolors = [
    Color(0xFFCC1E1E),
    Color(0xFF178B50),
    Color(0xFF4E5A65),
    Color(0xFFF23A3B),
    Color(0xFFCA3F81),
    Color(0xFFF05926),
  ];

  List _listData = [
    {
      'name': "SPU总数",
      'total': "260186",
      'change': "110"
    },
    {
      'name': "SKU总数",
      'total': "660186",
      'change': "520"
    },
    {
      'name': "总库存",
      'total': "23444",
      'change': "0"
    },
    {
      'name': "总货值",
      'total': "€186,594",
      'change': "€1110"
    },
    {
      'name': "已下载",
      'total': "60186",
      'change': "110"
    },
    {
      'name': "异常",
      'total': "26",
      'change': "54"
    }
  ];
  List _supplierList = [
    {
      'name': "Ridi",
      'add': "134",
      'now': "12122",
      'quantity': "2090",
      'worth': "12121"
    },
    {
      'name': "Brg",
      'add': "45",
      'now': "23211",
      'quantity': "1223",
      'worth': "343211"
    },
    {
      'name': "Theclutcher",
      'add': "333",
      'now': "23234",
      'quantity': "44443",
      'worth': "23343"
    },
    {
      'name': "Ridi",
      'add': "134",
      'now': "12122",
      'quantity': "2090",
      'worth': "12121"
    },
    {
      'name': "Brg",
      'add': "45",
      'now': "23211",
      'quantity': "1223",
      'worth': "343211"
    },
    {
      'name': "Theclutcher",
      'add': "333",
      'now': "23234",
      'quantity': "44443",
      'worth': "23343"
    }
  ];

  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);
  List<BarChartGroupData> data = [];
  @override
  void initState() {
    debugPrint('初始化首页');
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < 200 && _isShow) {
        setState(() {
          _isShow = false;
        });
      } else if (_scrollController.offset >= 200 && _isShow == false) {
        setState(() {
          _isShow = true;
        });
      }
    });
    data = [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 17,
              rodStackItem: [
                BarChartRodStackItem(0, 2, dark),
                BarChartRodStackItem(2, 12, normal),
                BarChartRodStackItem(12, 17, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 24,
              rodStackItem: [
                BarChartRodStackItem(0, 13, dark),
                BarChartRodStackItem(13, 14, normal),
                BarChartRodStackItem(14, 24, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 23.5,
              rodStackItem: [
                BarChartRodStackItem(0, 6.5, dark),
                BarChartRodStackItem(6.5, 18, normal),
                BarChartRodStackItem(18, 23.5, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 29,
              rodStackItem: [
                BarChartRodStackItem(0, 9, dark),
                BarChartRodStackItem(9, 15, normal),
                BarChartRodStackItem(15, 29, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 32,
              rodStackItem: [
                BarChartRodStackItem(0, 2.5, dark),
                BarChartRodStackItem(2.5, 17.5, normal),
                BarChartRodStackItem(17.5, 32, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 31,
              rodStackItem: [
                BarChartRodStackItem(0, 11, dark),
                BarChartRodStackItem(11, 18, normal),
                BarChartRodStackItem(18, 31, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 35,
              rodStackItem: [
                BarChartRodStackItem(0, 14, dark),
                BarChartRodStackItem(14, 27, normal),
                BarChartRodStackItem(27, 35, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 31,
              rodStackItem: [
                BarChartRodStackItem(0, 8, dark),
                BarChartRodStackItem(8, 24, normal),
                BarChartRodStackItem(24, 31, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 15,
              rodStackItem: [
                BarChartRodStackItem(0, 6.5, dark),
                BarChartRodStackItem(6.5, 12.5, normal),
                BarChartRodStackItem(12.5, 15, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 17,
              rodStackItem: [
                BarChartRodStackItem(0, 9, dark),
                BarChartRodStackItem(9, 15, normal),
                BarChartRodStackItem(15, 17, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 34,
              rodStackItem: [
                BarChartRodStackItem(0, 6, dark),
                BarChartRodStackItem(6, 23, normal),
                BarChartRodStackItem(23, 34, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 32,
              rodStackItem: [
                BarChartRodStackItem(0, 7, dark),
                BarChartRodStackItem(7, 24, normal),
                BarChartRodStackItem(24, 32, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 14.5,
              rodStackItem: [
                BarChartRodStackItem(0, 0.5, dark),
                BarChartRodStackItem(0.5, 12, normal),
                BarChartRodStackItem(12, 14.5, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 20,
              rodStackItem: [
                BarChartRodStackItem(0, 4, dark),
                BarChartRodStackItem(4, 15, normal),
                BarChartRodStackItem(15, 20, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 24,
              rodStackItem: [
                BarChartRodStackItem(0, 4, dark),
                BarChartRodStackItem(4, 15, normal),
                BarChartRodStackItem(15, 24, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 14,
              rodStackItem: [
                BarChartRodStackItem(0, 0.5, dark),
                BarChartRodStackItem(0.5, 12, normal),
                BarChartRodStackItem(12, 14, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 27,
              rodStackItem: [
                BarChartRodStackItem(0, 7, dark),
                BarChartRodStackItem(7, 25, normal),
                BarChartRodStackItem(25, 27, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 29,
              rodStackItem: [
                BarChartRodStackItem(0, 6, dark),
                BarChartRodStackItem(6, 23, normal),
                BarChartRodStackItem(23, 29, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 16.5,
              rodStackItem: [
                BarChartRodStackItem(0, 9, dark),
                BarChartRodStackItem(9, 15, normal),
                BarChartRodStackItem(15, 16.5, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 15,
              rodStackItem: [
                BarChartRodStackItem(0, 7, dark),
                BarChartRodStackItem(7, 12.5, normal),
                BarChartRodStackItem(12.5, 15, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 34,
              rodStackItem: [
                BarChartRodStackItem(0, 9, dark),
                BarChartRodStackItem(9, 24, normal),
                BarChartRodStackItem(24, 34, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 35,
              rodStackItem: [
                BarChartRodStackItem(0, 14.5, dark),
                BarChartRodStackItem(14.5, 27, normal),
                BarChartRodStackItem(27, 35, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 31,
              rodStackItem: [
                BarChartRodStackItem(0, 1, dark),
                BarChartRodStackItem(1, 17, normal),
                BarChartRodStackItem(17, 31, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 32,
              rodStackItem: [
                BarChartRodStackItem(0, 2, dark),
                BarChartRodStackItem(2, 16.5, normal),
                BarChartRodStackItem(16.5, 32, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 29,
              rodStackItem: [
                BarChartRodStackItem(0, 9, dark),
                BarChartRodStackItem(9, 15, normal),
                BarChartRodStackItem(15, 29, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('中台-实时数据'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('统计截至 2020-04-23 17:44:55  更新于7分钟前', style: TextStyles.textGray12,),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error_outline,
                      size: 16,
                      color: Colours.text_gray,
                    ),
                    Gaps.hGap4,
                    Text('介绍', style: TextStyles.textGray12)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: MyCard(
                child: Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: 1.3,
                    children: _listData.asMap().keys.map((index) {
                      return Container(
                        color: _bgcolors[index],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(_listData[index]['name'], style: TextStyles.textGray12),
                            Gaps.vGap2,
                            Text(_listData[index]['total'], style: TextStyle(fontSize: 18, color: _textcolors[index], fontWeight: FontWeight.bold)),
                            Gaps.vGap2,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('较昨日', style: TextStyles.textGray12),
                                Text('+'+_listData[index]['change'], style: TextStyle(fontSize: 12, color: _textcolors[index]))
                              ],
                            )
                          ],
                        ),
                      );
                    }).toList()
                  ),
                ),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFEFEFEF)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.center,
                          maxY: 35,
                          barTouchData: BarTouchData(
                            enabled: false,
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              textStyle: const TextStyle(color: Color(0xff939393), fontSize: 10),
                              margin: 10,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Apr';
                                  case 1:
                                    return 'May';
                                  case 2:
                                    return 'Jun';
                                  case 3:
                                    return 'Jul';
                                  case 4:
                                    return 'Aug';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              textStyle: const TextStyle(
                                  color: Color(
                                    0xff939393,
                                  ),
                                  fontSize: 10),
                              getTitles: (double value) {
                                return value.toInt().toString();
                              },
                              interval: 10,
                              margin: 0,
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            checkToShowHorizontalLine: (value) => value % 10 == 0,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: const Color(0xffe7e8ec),
                              strokeWidth: 1,
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          groupsSpace: 4,
                          barGroups: data,
                        ),
                      );
                    },
                    itemCount: 10,
                    viewportFraction: 1,
                    scale: 0.9,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('供应商最新商品数据', style: TextStyles.textBoldDark14),
                Gaps.vGap5,
                Text('7:00-10:00为更新高峰，数据如有滞后请谅解。', style: TextStyles.textGray12),
                Gaps.vGap5,
                Table(
                  columnWidths: const {
                    //列宽
                    0: FixedColumnWidth(84.0),
                    1: FixedColumnWidth(59.0),
                    2: FixedColumnWidth(59.0),
                    3: FixedColumnWidth(56.0),
                    4: FixedColumnWidth(56.0),
                    5: FixedColumnWidth(46.0),
                  },
                  border: TableBorder.all(
                  color: Colors.white,
                  width: 1.0,
                  style: BorderStyle.solid,
                
                ),
                children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                      ),
                      children: [
                        Container(
                          height: 40,
                          color: Color(0xFFF5F5F5),
                          alignment: Alignment.center,
                          child: Text('供应商',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12, color: Color(0xFF222222))),
                        ),
                        Container(
                          height: 40,
                          color: Color(0xFFFCF2E8),
                          alignment: Alignment.center,
                          child: Text('新增商品',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12, color: Color(0xFFFF5D00))),
                        ),
                        Container(
                          height: 40,
                          color: Color(0xFFFDEEEE),
                          alignment: Alignment.center,
                          child: Text('现有商品',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12, color: Color(0xFFF55253))),
                        ),
                        Container(
                          height: 40,
                          color: Color(0xFFE9F7EC),
                          alignment: Alignment.center,
                          child: Text('库存',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12, color: Color(0xFF178B50))),
                        ),
                        Container(
                          height: 40,
                          color: Color(0xFFF3F6F8),
                          alignment: Alignment.center,
                          child: Text('货值',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12, color: Color(0xFF4E5A65))),
                        ),
                        Container(
                          height: 40,
                          color: Color(0xFFF5F5F5),
                          alignment: Alignment.center,
                          child: Text('查看',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12, color: Color(0xFF222222))),
                        ),
                      ]
                    ),
                    ..._supplierList.map((index) {
                      return TableRow(
                        children: [
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(index['name'],style: TextStyle(fontSize: 12, color: Color(0xFF222222))),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(index['add'],style: TextStyle(fontSize: 12, color: Color(0xFF222222))),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(index['now'],style: TextStyle(fontSize: 12, color: Color(0xFF222222))),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(index['quantity'],style: TextStyle(fontSize: 12, color: Color(0xFF222222))),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(index['worth'],style: TextStyle(fontSize: 12, color: Color(0xFF222222))),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Text('查看',style: TextStyle(fontSize: 12, color: Color(0xFF005DEF))),
                          ),
                        ]
                      );
                    }).toList(),
                  ],
                ),
                Gaps.vGap16,
                Text('数据来源：中台每日公开数据', style: TextStyles.textGray12),
                Gaps.vGap16,
              ],
            ),
          )
        ],
      )
      ),
      // body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //       SliverAppBar(
      //         pinned: true,
      //         elevation: 2,
      //         floating: false,
      //         title: Text('helloe'),
      //         centerTitle: true
      //       )
      //     ];
      //   },
      //   body: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: <Widget>[
      //             Expanded(
      //               flex: 1,
      //               child: Text('统计截至 2020-04-23 17:44:55  更新于7分钟前', style: TextStyles.textGray12,),
      //             ),
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Icon(
      //                   Icons.error_outline,
      //                   size: 16,
      //                   color: Colours.text_gray,
      //                 ),
      //                 Gaps.hGap4,
      //                 Text('介绍', style: TextStyles.textGray12)
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 15),
      //         child: MyCard(
      //           child: Container(
      //             child: GridView.count(
      //               shrinkWrap: true,
      //               padding: EdgeInsets.all(0),
      //               physics: NeverScrollableScrollPhysics(),
      //               crossAxisCount: 3,
      //               childAspectRatio: 1.3,
      //               children: _listData.asMap().keys.map((index) {
      //                 print(index);
      //                 return Container(
      //                   color: _bgcolors[index],
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: <Widget>[
      //                       Text(_listData[index]['name'], style: TextStyles.textGray12),
      //                       Gaps.vGap2,
      //                       Text(_listData[index]['total'], style: TextStyle(fontSize: 18, color: _textcolors[index], fontWeight: FontWeight.bold)),
      //                       Gaps.vGap2,
      //                       Row(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: <Widget>[
      //                           Text('较昨日', style: TextStyles.textGray12),
      //                           Text('+'+_listData[index]['change'], style: TextStyle(fontSize: 12, color: _textcolors[index]))
      //                         ],
      //                       )
      //                     ],
      //                   ),
      //                 );
      //               }).toList()
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // )
    );
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final double opacity = isTouched ? 1 : 0.6;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff0293ee).withOpacity(opacity),
              value: 25,
              title: '',
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xfff8b250).withOpacity(opacity),
              value: 25,
              title: '',
              radius: 65,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color: const Color(0xff845bef).withOpacity(opacity),
              value: 25,
              title: '',
              radius: 60,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 25,
              title: '',
              radius: 70,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          default:
            return null;
        }
      },
    );
  }
  
}


class OpacityHeaderIcon extends StatelessWidget {
  final double width;
  final IconData icon;
  final double opacity;
  final VoidCallback onPressed;

  OpacityHeaderIcon({
    Key key,
    this.width = 40.0,
    this.opacity = 0.55,
    this.icon,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          width: width,
          alignment: Alignment.center,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36)
            ),
            child: Icon(icon, size: 20, color: Colors.black),
          ),
        ),
      )
    );
  }
}
