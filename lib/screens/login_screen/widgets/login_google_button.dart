import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: ScalableSize(context).getScalableWidth(40),
        width: ScalableSize(context).getScalableWidth(200),
        color: const Color(0xFF4285F4),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              width: ScalableSize(context).getScalableWidth(38),
              height: ScalableSize(context).getScalableWidth(38),
              child: Center(
                child: SvgPicture.asset(
                  "assets/google_logo.svg",
                  width: ScalableSize(context).getScalableWidth(18),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
