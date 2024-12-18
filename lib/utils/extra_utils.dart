import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAnnotatedRegion extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle overlayStyle;
  final Color backgroundColor;

  const MyAnnotatedRegion({
    Key? key,
    required this.child,
    this.overlayStyle = SystemUiOverlayStyle.light,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Container(
        color: backgroundColor,
        child: child,
      ),
    );
  }
}
