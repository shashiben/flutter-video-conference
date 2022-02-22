// Flutter imports:
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? error;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int maxLines;
  final Function(String)? validator;
  final Widget suffix;
  final String? hint;
  final Color? color;
  final bool obscure;
  final TextEditingController? controller;
  final IconData? iconData;
  final bool enable;

  const InputField(
      {Key? key,
      this.hint,
      this.color,
      this.enable = true,
      this.suffix = const SizedBox(),
      this.controller,
      this.obscure = false,
      this.iconData,
      this.error = "",
      this.keyboardType,
      this.maxLength,
      this.maxLines = 1,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enable,
      controller: controller,
      maxLength: maxLength ?? null,
      maxLines: maxLines,
      obscureText: obscure,
      onChanged: validator ?? null,
      keyboardType: keyboardType,
      style: TextStyle(color: Color.fromRGBO(38, 50, 56, .50)),
      decoration: InputDecoration(
          errorText: error!.isEmpty ? null : error,
          hintText: hint,
          hintStyle: TextStyle(
            color: Color.fromRGBO(38, 50, 56, 0.30),
            fontSize: 15.0,
            fontFamily: "Gilroy",
          ),
          filled: true,
          suffixIcon: suffix,
          fillColor: color ?? Colors.grey[100],
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          prefixIcon: iconData != null
              ? Icon(iconData)
              : SizedBox(
                  width: 0.1,
                )),
    );
  }
}
