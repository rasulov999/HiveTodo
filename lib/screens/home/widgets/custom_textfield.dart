import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          hintText: hintText,
        ),
      ),
    );
  }
}
