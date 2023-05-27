import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whats/common/extension/Custom_theme_extension.dart';
import 'package:whats/common/utils/coloors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? fontSize;
  final bool? autoFocus;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyboardType,
    this.prefixText,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.fontSize,
    this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      onChanged: onChanged,
      style: TextStyle(fontSize: fontSize),
      autofocus: autoFocus ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        suffix: suffixIcon,
        hintText: hintText,
        prefixText: prefixText,
        hintStyle: TextStyle(color: context.theme.greyColor),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Coloors.greenDark,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenDark, width: 2),
        ),
      ),
    );
  }
}
