import 'package:fluttertoast/fluttertoast.dart';

void showShortToast(String text, [ToastGravity gravity = ToastGravity.BOTTOM, Toast toastLength = Toast.LENGTH_SHORT]) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: toastLength,
    gravity: gravity
  );
}

void showCenterToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER
  );
}