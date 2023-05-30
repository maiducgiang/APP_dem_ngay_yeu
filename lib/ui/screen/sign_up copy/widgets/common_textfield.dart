import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Color? color;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final bool enableBorder;
  final bool enable;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onChange;
  final bool isPassword;
  final EdgeInsetsGeometry contentPadding;
  final String? Function(String?)? validator;
  final bool? currencyTextField;
  final void Function(String)? onSubmitted;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.color,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.textInputType = TextInputType.text,
    this.enableBorder = true,
    this.enable = true,
    this.onTap,
    this.onChange,
    this.isPassword = false,
    this.validator,
    this.currencyTextField,
    this.onSubmitted,
    this.contentPadding = const EdgeInsets.symmetric(
        horizontal: 12, vertical: 14), this.focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChange,
      enabled: enable,
      controller: controller,
      textAlign: textAlign,
      obscureText: isPassword,
      keyboardType: textInputType,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
          filled: true,
          fillColor: color ?? Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.withOpacity(0.8)
          ),
          contentPadding: contentPadding
      ),
    );
  }
}