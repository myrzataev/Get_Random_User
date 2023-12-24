
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomTextField({
    
    super.key,
    required this.hintText,
    required this.labelText,
    this.controller,
    required this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        keyboardType: keyboardType
        ,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4))),
      ),
    );
  }
}
