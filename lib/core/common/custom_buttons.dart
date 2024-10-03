import 'package:aapda_mitra/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Decoration? decoration;
  final Color? buttonBackgroundColor;
  final Color? textColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final Function()? onPressed;
  final Function(bool)? onFocusChange;

  const CustomPrimaryButton(
      {super.key,
      required this.buttonText,
      this.style,
      this.textStyle,
      this.decoration,
      this.buttonBackgroundColor,
      this.textColor,
      this.buttonHeight,
      this.buttonWidth,
      this.margin,
      this.focusNode,
      this.onPressed,
      this.onFocusChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
      decoration: decoration ??
          BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: buttonBackgroundColor ?? Theme.of(context).primaryColor),
      height: buttonHeight ?? 48,
      width: buttonWidth ?? 300,
      child: ElevatedButton(
          focusNode: focusNode,
          style: style,
          onPressed: onPressed,
          onFocusChange: onFocusChange,
          child: Text(
            buttonText,
            style: textStyle ??
                TextStyle(
                    color: textColor ?? Colors.white,
                    fontFamily: Constants.inter,
                    fontWeight: FontWeight.w600),
          )),
    );
  }
}


//  margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
//       decoration: decoration ??
//           BoxDecoration(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               color: buttonBackgroundColor ?? Theme.of(context).primaryColor),
//       height: buttonHeight ?? 48,
//       width: buttonWidth ?? 300,
