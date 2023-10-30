import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Icon icon;
  final String? toolTip;

  const IconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.toolTip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: icon,
      tooltip: toolTip,
    );
  }
}
