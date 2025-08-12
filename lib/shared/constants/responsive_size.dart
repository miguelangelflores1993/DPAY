import 'package:flutter/widgets.dart';
import 'package:flutter_device_type/flutter_device_type.dart' as device_type;
import 'package:sizer/sizer.dart';

class ResponsiveSize {
  static double getSize({required double mobile, required TabletSize tablet}) {
    if (device_type.Device.get().isPhone) return mobile;
    if (device_type.Device.get().isTablet) {
      
      return Device.orientation == Orientation.portrait ? tablet.portrait : tablet.horizontal;
    }
    return 0; 
  }
}

// modelo tablet horiztonal, vertical
class TabletSize {
  TabletSize({required this.horizontal, required this.portrait});
  final double portrait;
  final double horizontal;
}
