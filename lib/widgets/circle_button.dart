import 'package:commy/theme.dart';
import 'package:flutter/material.dart';

class CustomCircleIconButton extends StatelessWidget {
  final Function()? onTap;
  final Color backgroundColor;
  final Color disabledColor;
  final double size;
  final Widget icon;

  const CustomCircleIconButton({
    Key? key,
    this.onTap,
    this.backgroundColor = CColors.mainColor,
    this.disabledColor = CColors.textColor,
    this.size = 46,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: onTap == null ? disabledColor : backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: icon,
        ),
      ),
    );
  }
}
