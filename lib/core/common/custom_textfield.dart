import 'package:aapda_mitra/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  final String customLabel;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final TextStyle? keyBoardTextstyle;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  const CustomTextfield(
      {super.key,
      required this.customLabel,
      required this.hintText,
      this.controller,
      this.focusNode,
      this.onEditingComplete,
      this.decoration,
      this.keyboardType,
      this.onSubmitted,
      this.inputFormatters,
      this.enabled,
      this.keyBoardTextstyle,
      this.onTap,
      this.onTapOutside,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.dispose();
    }
    if (widget.focusNode != null) {
      widget.focusNode!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.customLabel,
          style: const TextStyle(
              fontFamily: AppTheme.secondaryFont,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppTheme.primaryColor),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 54,
          child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onEditingComplete: widget.onEditingComplete,
            onSubmitted: widget.onSubmitted,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            style: widget.keyBoardTextstyle ??
                const TextStyle(fontSize: 14, color: Color(0xFF4F4F4F)),
            onTap: widget.onTap,
            onTapOutside: widget.onTapOutside,
            obscureText: widget.obscureText ?? false,
            decoration: widget.decoration ??
                InputDecoration(
                  icon: widget.icon,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    fontFamily: AppTheme.secondaryFont,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF4F4F4F),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xFFD8DADC),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xFFD8DADC),
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
