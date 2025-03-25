import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CusttomTextFormFeild extends StatelessWidget {
  const CusttomTextFormFeild({
    super.key,
    required this.controller,
    this.keyboardType,
    required this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.inputFormatters,
    this.filled,
    this.fillColor,
    this.disabledBorder,
    this.enabledBorder,
    this.validator,
    this.hintStyle, this.onSubmitted,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
final  void Function(String)? onSubmitted;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onFieldSubmitted:onSubmitted ,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLength ?? 1,
      minLines: minLines,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        border: disabledBorder,
        focusedBorder: enabledBorder,
      ),
    );
  }
}
