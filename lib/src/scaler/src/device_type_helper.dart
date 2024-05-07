import 'package:flutter/material.dart';
import 'package:busha_app/src/scaler/src/breakpoints.dart';

class DeviceTypeHelper {
  final BuildContext context;

  const DeviceTypeHelper(this.context);
  const DeviceTypeHelper.of(this.context);

  double get _width {
    return View.of(context).physicalSize.width /
        View.of(context).devicePixelRatio;
  }

  bool get isMobile => _width < kTabletBreakPoint;

  bool get isTablet => _width >= kTabletBreakPoint && _width < kWebBreakPoint;

  bool get isWeb => _width >= kWebBreakPoint;
}
