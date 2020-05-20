import 'package:flutter/material.dart';

class LoadAssetImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final String format;

  const LoadAssetImage(this.image, {
    Key key,
    this.width,
    this.height, 
    this.fit,
    this.format: 'png', 
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      // ImageUtils.getImgPath(image, format: format),
      'assets/$image.$format',
      height: height,
      width: width,
      fit: fit
    );
  }
}