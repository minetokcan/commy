import 'package:commy/theme.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final double? width;
  final double height;
  final Color color;
  final Color disabledColor;
  final BorderRadius? borderRadius;
  final Widget? icon;

  const ConfirmButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.height = 56,
    this.color = CColors.mainColor,
    this.disabledColor = CColors.foregroundBlack,
    this.width = double.infinity,
    this.borderRadius,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16)),
      ),
      backgroundColor:
          MaterialStateProperty.all(onPressed != null ? color : disabledColor),
    );

    return SizedBox(
      width: width,
      height: height,
      child: icon == null
          ? ElevatedButton(
              style: buttonStyle,
              onPressed: onPressed,
              child: child,
            )
          : ElevatedButton.icon(
              style: buttonStyle,
              onPressed: onPressed,
              label: child,
              icon: icon!,
            ),
    );
  }
}
