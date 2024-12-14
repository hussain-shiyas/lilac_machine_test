import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final String prefixImageName;
  final bool isObscureText;
  final bool isSuffixIcon;
  final TextEditingController controller;

  const LoginTextField({
    super.key,
    required this.title,
    this.isObscureText = false,
    this.isSuffixIcon = false,
    required this.hintText,
    required this.prefixImageName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.white,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: isSuffixIcon ? Icon(Icons.visibility_off) : null,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Image.asset(prefixImageName),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(0xff6F6C7A),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            obscureText: isObscureText,
          ),
        ),
      ],
    );
  }
}
