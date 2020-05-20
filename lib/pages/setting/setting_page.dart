import 'dart:math';
import 'package:flutter/material.dart';

import 'package:data_analysis/route/index.dart';
import 'package:data_analysis/style/resources.dart';
import 'package:data_analysis/widgets/dialog/tip_dialog.dart';
import 'package:data_analysis/widgets/my_card.dart';
import 'package:data_analysis/widgets/click_item.dart';
import 'package:data_analysis/utils/options_util.dart';
import 'package:data_analysis/themes/normal_theme_data.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // AnimationController _rotatecontroller;
  // bool _showMark = false;
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final options = OptionsUtil.of(context);

    return Material(
      color: colorScheme.secondaryVariant,
      child: Stack(
        children: <Widget>[
          Scaffold(
            // backgroundColor: Color(0xFFF2F2F2),
            appBar: AppBar(
              // brightness: Brightness.light,
              title: Text('设置'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  MyCard(
                    color: Colors.white,
                    borderRadius: 0,
                    child: Column(
                      children: <Widget>[
                        ClickItem(
                          label: '实名认证',
                          value: '',
                          hintText: '已认证',
                          onPressed: () {
                            NavigatorUtils.goTest2Page(context);
                            // RouteUtil.routeToVerifiedPage(context, {});
                          }
                        ),
                        ClickItem(
                          label: '微信名片',
                          value: '',
                          onPressed: () {
                            // OptionsUtil.update(context, NormalThemeData.darkThemeData);
                            // CountContainer state = CountContainer.of(context);
                            // state.increment();
                            setState(() {
                              if (_isDark == true) {
                                _isDark = false;
                              } else {
                                _isDark = true;
                              }
                            });
                            Provider.of<ThemeProvider>(context, listen: false).setTheme(_isDark);
                          }
                        ),
                        ClickItem(
                          label: '账户安全',
                          value: '',
                          hintText: '修改密码/修改手机',
                          showLine: false,
                          onPressed: () {

                          }
                        ),
                      ],
                    ),
                  ),
                  Gaps.vGap10,
                  Material(
                    // color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        showTipDialog(
                          context,
                          content: '是否退出当前登录',
                          confirmText: '确定',
                          confirmColor: Colours.red,
                          success: () {
                            print('12121');
                            // RouteUtil.routeSignOut(context);
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 5, left: 12),
                        height: 52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('退出登录', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // CustomPaint(
                  //   size: Size(200, 200), painter: WheelPainter(),
                  // )
                  // FlatButton(
                  //   color: Colors.yellow,
                  //   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  //   colorBrightness: Brightness.light,
                  //   onPressed: () {},
                  //   child: Row(children: <Widget>[Icon(Icons.add), Text('add')],),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}

class WheelPainter extends CustomPainter {
  Paint getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double wheelSize = min(size.width,size.height)/2;
    double nbElem = 6;
    double radius = (2 * pi) / nbElem;
    Rect boundingRect = Rect.fromCircle(center: Offset(wheelSize, wheelSize), radius: wheelSize);

    canvas.drawArc(boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(boundingRect, radius, radius, true, getColoredPaint(Colors.black38)); 
    canvas.drawArc(boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green)); 
    canvas.drawArc(boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red)); 
    canvas.drawArc(boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue)); 
    canvas.drawArc(boundingRect, radius * 5, radius, true, getColoredPaint(Colors.pink));
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

// import 'package:flutter/material.dart';
// import 'dart:collection';

// final settingItemBorderRadius = BorderRadius.circular(10);
// const settingItemHeaderMargin = EdgeInsetsDirectional.fromSTEB(32, 0, 32, 8);
// enum _ExpandableSetting {
//   textScale,
//   textDirection,
//   locale,
//   platform,
//   theme,
// }

// class SettingPage extends StatefulWidget {
//   @override
//   _SettingPageState createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage>{
//   _ExpandableSetting _expandedSettingId;
//   @override
//   void initState() {
//     super.initState();
//     print('设置页面');
//   }

//   void onTapSetting(_ExpandableSetting settingId) {
//     setState(() {
//       if (_expandedSettingId == settingId) {
//         _expandedSettingId = null;
//       } else {
//         _expandedSettingId = settingId;
//       }
//     });
//   }

//   static void onOptionChanged() {
//     // return 1.0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final options = GalleryOptions.of(context);
//     final settingsListItems = [
//       SettingsListItem<double>(
//         title: '语言',
//         selectedOption: options.textScaleFactor(
//           context,
//           useSentinel: true,
//         ),
//         options: LinkedHashMap.of({
//           0.8: DisplayOption('颜色'),
//           1.2: DisplayOption('尺码'),
//         }),
//         onOptionChanged: () => onOptionChanged(context),
//         onTapSetting: () => onTapSetting(_ExpandableSetting.textScale),
//         isExpanded: _expandedSettingId == _ExpandableSetting.textScale,
//       )
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('设置页面'),
//         centerTitle: true,
//       ),
//     );
//   }
// }


// class SettingsListItem<T> extends StatefulWidget {
//   SettingsListItem({
//     Key key,
//     @required this.title,
//     @required this.options,
//     @required this.selectedOption,
//     @required this.onOptionChanged,
//     @required this.onTapSetting,
//     @required this.isExpanded,
//   }) : super(key: key);

//   final String title;
//   final LinkedHashMap<T, DisplayOption> options;
//   final T selectedOption;
//   final ValueChanged<T> onOptionChanged;
//   final Function onTapSetting;
//   final bool isExpanded;

//   @override
//   _SettingsListItemState createState() => _SettingsListItemState<T>();
// }

// class _SettingsListItemState<T> extends State<SettingsListItem> with SingleTickerProviderStateMixin {
//   static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
//   static const _expandDuration = Duration(milliseconds: 150);
//   AnimationController _controller;
//   Animation<double> _childrenHeaderFactor;
//   Animation<double> _headerChevronRotation;
//   Animation<double> _headerSubtitleHeight;
//   Animation<EdgeInsetsGeometry> _headerMargin;
//   Animation<EdgeInsetsGeometry> _headerPadding;
//   Animation<EdgeInsetsGeometry> _childrenPadding;
//   Animation<BorderRadius> _headerBorderRadius;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(duration: _expandDuration, vsync: this);
//     _childrenHeaderFactor = _controller.drive(_easeInTween);
//     _headerChevronRotation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
//     _headerMargin = EdgeInsetsGeometryTween(begin: settingItemHeaderMargin, end: EdgeInsets.zero).animate(_controller);
//     _headerPadding = EdgeInsetsGeometryTween(begin: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 10), end: EdgeInsetsDirectional.fromSTEB(32, 18, 32, 20)).animate(_controller);
//     _headerSubtitleHeight = _controller.drive(Tween<double>(begin: 1.0, end: 0.0));
//     _childrenPadding = EdgeInsetsGeometryTween(begin: EdgeInsets.symmetric(horizontal: 32), end: EdgeInsets.zero,).animate(_controller);
//     _headerBorderRadius = BorderRadiusTween(begin: settingItemBorderRadius, end: BorderRadius.zero).animate(_controller);

//     if (widget.isExpanded) {
//       _controller.value = 1.0;
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _handleExpansion() {
//     if (widget.isExpanded) {
//       _controller.forward();
//     } else {
//       _controller.reverse().then<void>((value) {
//         if(!mounted) {
//           return;
//         }
//       });
//     }
//   }

//   Widget _buildHeaderWithChildren(BuildContext context, Widget child) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         _CategoryHeader(
//           margin: _headerMargin.value,
//           padding: _headerPadding.value,
//           borderRadius: _headerBorderRadius.value,
//           subtitleHeight: _headerSubtitleHeight,
//           chevronRotation: _headerChevronRotation,
//           title: widget.title,
//           subtitle: widget.options[widget.selectedOption]?.title ?? '',
//           onTap: () => widget.onTapSetting(),
//         ),
//         Padding(
//           padding: _childrenPadding.value,
//           child: ClipRect(
//             child: Align(
//               heightFactor: _childrenHeaderFactor.value,
//               child: child,
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     _handleExpansion();
//     final theme = Theme.of(context);
//     final optionWidgetsList = <Widget>[];

//     widget.options.forEach((optionValue, optionDisplay) => optionWidgetsList.add(
//       RadioListTile<T>(
//         value: optionValue,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               optionDisplay.title,
//               style: theme.textTheme.bodyText1.copyWith(
//                 color: Theme.of(context).colorScheme.onPrimary,
//               ),
//             ),
//             if (optionDisplay.subtitle != null)
//               Text(
//                 optionDisplay.subtitle,
//                 style: theme.textTheme.bodyText1.copyWith(
//                   fontSize: 12,
//                   color: Theme.of(context)
//                       .colorScheme
//                       .onPrimary
//                       .withOpacity(0.8),
//                 ),
//               ),
//           ],
//         ),
//         groupValue: widget.selectedOption,
//         onChanged: (newOption) => widget.onOptionChanged(newOption),
//         activeColor: Theme.of(context).colorScheme.primary,
//         dense: true,
//       )
//     ));

//     return AnimatedBuilder(
//       animation: _controller.view,
//       builder: _buildHeaderWithChildren,
//       child: Container(
//         margin: EdgeInsetsDirectional.only(start: 24, bottom: 40),
//         decoration: BoxDecoration(
//           border: BorderDirectional(
//             start: BorderSide(width: 2, color: theme.colorScheme.background)
//           )
//         ),
//         child: ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) => optionWidgetsList[index],
//           itemCount: widget.isExpanded ? optionWidgetsList.length : 0,
//         ),
//       ),
//     );
//   }
// }

// class DisplayOption {
//   final String title;
//   final String subtitle;

//   DisplayOption(this.title, {this.subtitle});
// }

// class _CategoryHeader extends StatelessWidget {
//   const _CategoryHeader({
//     Key key,
//     this.margin,
//     this.padding,
//     this.borderRadius,
//     this.subtitleHeight,
//     this.chevronRotation,
//     this.title,
//     this.subtitle,
//     this.onTap,
//   }) : super(key: key);

//   final EdgeInsetsGeometry margin;
//   final EdgeInsetsGeometry padding;
//   final BorderRadiusGeometry borderRadius;
//   final String title;
//   final String subtitle;
//   final Animation<double> subtitleHeight;
//   final Animation<double> chevronRotation;
//   final GestureTapCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     return Container(
//       margin: margin,
//       child: Material(
//         shape: RoundedRectangleBorder(borderRadius: borderRadius),
//         color: colorScheme.secondary,
//         clipBehavior: Clip.antiAlias,
//         child: InkWell(
//           onTap: onTap,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(
//                 child: Padding(
//                   padding: padding,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         title,
//                         style: textTheme.subtitle1.apply(
//                           color: colorScheme.onSurface,
//                         ),
//                       ),
//                       SizeTransition(
//                         sizeFactor: subtitleHeight,
//                         child: Text(
//                           subtitle,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: textTheme.overline.apply(
//                             color: colorScheme.primary,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.only(
//                   start: 8,
//                   end: 24,
//                 ),
//                 child: RotationTransition(
//                   turns: chevronRotation,
//                   child: const Icon(Icons.arrow_drop_down),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }