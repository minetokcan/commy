import 'package:commy/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? suffixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final void Function()? onTap;
  final TextAlign textAlign;
  final int? minLine;
  final int? maxline;
  final Color borderColor;
  final String? inputLabelText;
  final bool borderIsVisible;
  final int? maxLength;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? inputAction;
  final bool autoFocus;
  final EdgeInsets contentPadding;
  final Widget? counter;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.suffixText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textAlign = TextAlign.left,
    this.minLine,
    this.maxline = 1,
    this.inputLabelText,
    this.borderColor = CColors.foregroundBlack,
    this.borderIsVisible = true,
    this.maxLength,
    this.onFieldSubmitted,
    this.focusNode,
    this.inputAction = TextInputAction.done,
    this.autoFocus = false,
    this.contentPadding = const EdgeInsets.all(16),
    this.counter,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          maxLength: maxLength,
          minLines: minLine,
          maxLines: maxline,
          textCapitalization: TextCapitalization.sentences,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initialValue,
          controller: controller,
          textInputAction: inputAction,
          onChanged: onChanged,
          obscureText: obscureText,
          validator: validator,
          autofocus: autoFocus,
          textAlign: textAlign,
          onTap: onTap,
          style: Styles.title,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            isCollapsed: true,
            counter: counter,
            labelText: inputLabelText,
            prefixIcon: prefixIcon,
            alignLabelWithHint: true,
            suffixIcon: suffixIcon,
            hintText: hintText,
            suffixText: suffixText,
            hintStyle: const TextStyle(fontSize: 17),
            labelStyle: const TextStyle(color: CColors.subtitleColor, fontSize: 14),
            errorBorder: borderIsVisible
                ? OutlineInputBorder(
                    gapPadding: 8,
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: CColors.mainColor, width: 2),
                  )
                : InputBorder.none,
            focusedErrorBorder: borderIsVisible
                ? OutlineInputBorder(
                    gapPadding: 8,
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: CColors.mainColor, width: 2),
                  )
                : InputBorder.none,
            enabledBorder: borderIsVisible
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: borderColor, width: 2),
                  )
                : InputBorder.none,
            focusedBorder: borderIsVisible
                ? OutlineInputBorder(
                    gapPadding: 8,
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: CColors.textColor, width: 2),
                  )
                : InputBorder.none,
            contentPadding: contentPadding,
          ),
        ),
      ],
    );
  }
}
