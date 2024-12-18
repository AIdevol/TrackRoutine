import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trackroutine/utils/color_Utilities.dart';

Color kPrimarykColors = HexColor("D4AF37");
Color kSeconderyColors = HexColor("FFFACD");
Color kTertiaryColors = HexColor("B8860B");
Color kGoldyellow = HexColor("FFD700");
Color kDeepCharcoalGray= HexColor('333333');
Color kSoftWhite = HexColor('F5F5F5');
Color kRichBurgundy = HexColor('800020');
Color kMutedNavyBlue = HexColor("1D2A44");
Color kSoftTaupe = HexColor('D8CAB8');

final linearGradientBackGround = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    kPrimarykColors.withOpacity(0.2),
    kPrimarykColors.withOpacity(0.8),
  ],
);