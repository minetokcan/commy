import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Widget? icon;
  final IconData? iconData;
  final Color color;
  final Color? splashColor;
  final Color? iconColor;
  final Color? textColor;
  final bool noSize;
  final String? image;
  final double? textSize;

  const LoginButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.icon,
      required this.color,
      this.splashColor,
      this.iconData,
      this.iconColor,
      this.textColor,
      this.noSize = false,
      this.image,
      this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: splashColor,
        backgroundColor: color,
        fixedSize: noSize ? null : const Size(350, 56),
        // shape: Helper.shape,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (icon != null || iconData != null)
            Positioned(
              left: 8,
              child: icon ?? Icon(iconData, size: 24, color: iconColor),
            ),
          if (image != null)
            Positioned(
              left: 8,
              child: Image.asset("assets/images/${image!}.png", width: 24),
            ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize ?? 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
