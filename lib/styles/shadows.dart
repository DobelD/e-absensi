import 'package:eabsenku/styles/color.dart';
import 'package:flutter/material.dart';

class Shadows {
  BoxShadow get normal => BoxShadow(
      color: colorPrimary.withOpacity(0.03),
      blurRadius: 20,
      offset: Offset(0, 5));

  BoxShadow get upShadow => BoxShadow(
      color: colorPrimary.withOpacity(0.03),
      blurRadius: 20,
      offset: Offset(0, -10));
}
