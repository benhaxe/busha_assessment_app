import 'package:flutter/material.dart';
import 'package:busha_app/src/scaler/src/extensions.dart';

class XMargin extends StatelessWidget {
  const XMargin(this._x, {super.key});
  final double _x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.scale(_x));
  }
}

class YMargin extends StatelessWidget {
  const YMargin(this._y, {super.key});
  final double _y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.scaleY(_y),
    );
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;
