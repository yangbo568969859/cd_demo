import 'package:flutter/material.dart';
// import 'package:demo/router/router_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';


// class TransParencyDialog extends StatefulWidget {
//   @override
//   _TransParencyDialogState createState() => _TransParencyDialogState();
// }

class TransParencyDialog extends StatelessWidget {

  const TransParencyDialog({
    Key key,
    this.backgroundImage,
    this.onPressed,
  }) : super(key : key);

  final String backgroundImage;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInCubic,
        child: Container(
          width: width - 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: onPressed,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // child: Image.network(backgroundImage),
                          child: CachedNetworkImage(
                            imageUrl: backgroundImage,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              GestureDetector(
                onTap: () {
                  // RouteUtil.goBack(context);
                },
                child: Container(
                  width: 200,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 36,
                        child: Container(
                          width: 1.8,
                          height: 28,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('assets/images/icon/icon_circle-close.png', width: 36, height: 36)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}