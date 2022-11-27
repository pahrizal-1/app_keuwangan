import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatelessWidget {
  final String title;
  final bool? obscureText;
  final TextEditingController? controller;
  final bool? isShowTitle;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;

  const InputForm(
      {super.key,
      required this.title,
      this.obscureText,
      this.controller,
      this.isShowTitle,
      this.onFieldSubmitted,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    FocusNode ex = FocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        decoration: InputDecoration(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          labelText: title,
          labelStyle: GoogleFonts.poppins(
              fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.grey.shade500)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
