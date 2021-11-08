import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Log in".toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      height: ScalableSize(context).getScalableHeight(53),
      width: ScalableSize(context).getScalableWidth(323),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: const Color(0xFF71883A),
      ),
    );
  }
}
