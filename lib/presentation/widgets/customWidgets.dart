import 'package:flutter/material.dart';

Widget customTextField(controller, label) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            )),
      ),
    ),
  );
}

Widget customPasswordTextField(controller, label) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        obscureText: true,
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            label: Text(label),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            )),
      ),
    ),
  );
}
