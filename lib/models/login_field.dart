// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  const MyField(
      {super.key,
      required this.hintText,
      this.controller,
      required this.obsecure});
  final String hintText;
  final controller;
  final bool obsecure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: TextField(
        obscureText: obsecure,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}
