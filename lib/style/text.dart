import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

class TextStyles {
  static const TextStyle textMain12 = const TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.app_main,
  );
  static const TextStyle textMain14 = const TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.app_main,
  );
  static const TextStyle textNormal12 = const TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_normal,
  );
  static const TextStyle textDark12 = const TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_dark,
  );
  static const TextStyle textDark13 = const TextStyle(
    fontSize: Dimens.font_sp13,
    color: Colours.text_dark,
  );
  static const TextStyle textDark14 = const TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_dark,
  );
  static const TextStyle textDark16 = const TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_dark,
  );
  static const TextStyle textBoldDark14 = const TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text_dark,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textBoldDark16 = const TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colours.text_dark,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textBoldDark18 = const TextStyle(
    fontSize: Dimens.font_sp18,
    color: Colours.text_dark,
    fontWeight: FontWeight.bold
  );
  static const TextStyle textBoldDark24 = const TextStyle(
      fontSize: 24.0,
      color: Colours.text_dark,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textBoldDark26 = const TextStyle(
      fontSize: 26.0,
      color: Colours.text_dark,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textGray10 = const TextStyle(
    fontSize: Dimens.font_sp10,
    color: Colours.text_gray,
  );
  static const TextStyle textGray12 = const TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray,
  );
  static const TextStyle textGray14 = const TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  static const TextStyle textGray16 = const TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_gray,
  );
  static const TextStyle textGrayC12 = const TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray_c,
  );
  static const TextStyle textGrayC14 = const TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray_c,
  );
}


// 渐变文字
class GradientText extends StatelessWidget {
 GradientText(this.data, {@required this.gradient, this.style, this.textAlign = TextAlign.left});

 final String data;
 final Gradient gradient;
 final TextStyle style;
 final TextAlign textAlign;

 @override
 Widget build(BuildContext context) {
   return ShaderMask(
    shaderCallback: (bounds) {
      return gradient.createShader(Offset.zero & bounds.size);
    },
    child: Text(
      data,
      textAlign: textAlign,
      style: (style == null)
      ? TextStyle(color: Colors.white)
      : style.copyWith(color: Colors.white),
    ),
   );
 }
}