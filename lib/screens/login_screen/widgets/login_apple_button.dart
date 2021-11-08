import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginAppleButton extends StatelessWidget {
  const LoginAppleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: ScalableSize(context).getScalableWidth(40),
        width: ScalableSize(context).getScalableWidth(200),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/apple_logo.svg",
              width: ScalableSize(context).getScalableWidth(11),
            ),
            SizedBox(
              width: ScalableSize(context).getScalableWidth(12),
            ),
            const Text(
              "Sign in with Apple",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
