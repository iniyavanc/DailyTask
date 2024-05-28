import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppTheme.dart';

class Button extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final VoidCallback? onPressed;
  final BorderSide borderColor;

  Button({
    Key? key,
    required this.child,
    this.onPressed,
    this.widthFactor = 0.4,
    this.heightFactor = 0.06,
    this.borderColor = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * heightFactor,
      width: widthFactor != 0 ? screenSize.width * widthFactor : null,
      decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.circular(5.5)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.liteGreen,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.5), side: borderColor)),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
