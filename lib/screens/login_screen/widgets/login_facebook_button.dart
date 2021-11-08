import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginFacebookButton extends StatelessWidget {
  const LoginFacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: ScalableSize(context).getScalableWidth(40),
        width: ScalableSize(context).getScalableWidth(200),
        color: const Color(0xFF3B5998),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/facebook_logo.svg",
              width: ScalableSize(context).getScalableWidth(18),
            ),
            SizedBox(
              width: ScalableSize(context).getScalableWidth(10),
            ),
            const Text(
              "Sign in with Facebook",
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
