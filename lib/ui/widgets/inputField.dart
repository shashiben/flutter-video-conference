import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String error;
  final TextInputType keyboardType;
  final bool isSecure;
  final int maxLength;
  final int maxLines;
  final Function(String) validator;
  final String hint;
  final Color color;
  final bool obscure;

  const InputField(
      {Key key,
      this.hint,
      this.color,
      this.obscure,
      this.error = "",
      this.isSecure = false,
      this.keyboardType,
      this.maxLength,
      this.maxLines = 1,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength ?? null,
      maxLines: maxLines,
      obscureText: isSecure,
      onChanged: validator ?? null,
      keyboardType: keyboardType,
      style: TextStyle(color: Color.fromRGBO(38, 50, 56, .50)),
      decoration: InputDecoration(
        errorText: error.isEmpty ? null : error,
        hintText: hint,
        hintStyle: TextStyle(
          color: Color.fromRGBO(38, 50, 56, 0.30),
          fontSize: 15.0,
          fontFamily: "Gilroy",
        ),
        filled: true,
        fillColor: color ?? Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
      ),
    );
  }
}
