import 'package:flutter/material.dart';

TextFormField customTextFileld({required String hintText, IconData? icon, required TextEditingController controller}) {
  return TextFormField(
    enableSuggestions: false,
    autocorrect: false,
    textInputAction: TextInputAction.done,
    controller: controller,
    decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(icon)),
  );
}
