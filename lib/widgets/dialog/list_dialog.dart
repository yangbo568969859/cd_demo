import 'package:flutter/material.dart';

/// 发起网络请求
/// [ title ] 提示的标题
/// [ content ] 提示的内容
/// [ showCancel ] 是否显示取消按钮
/// [ cancelText ] 取消按钮的文字，最多 4 个字符
/// [ cancelColor ] 取消按钮的文字颜色，必须是 16 进制格式的颜色字符串
/// [ confirmText ] 确认按钮的文字，最多 4 个字符
/// [ confirmColor ] 确认按钮的文字颜色，必须是 16 进制格式的颜色字符串
/// [ success ] 接口调用成功的回调函数
/// [ fail ] 接口调用失败的回调函数

void showListDialog(context, {
  List operateList,
  VoidCallback success,
  VoidCallback fail,

}) {
  showDialog(
    // 传入 context
    context: context,
    // 构建 Dialog 的视图
    builder: (_) => Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child: Column(
              children: operateList.map((item) {
                return Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      item['onPressed']();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 46,
                      child: Text(item['title']),
                    ),
                  ),
                );
              }).toList()
            ),
          )
        ],
      ),
    ),
  );
}