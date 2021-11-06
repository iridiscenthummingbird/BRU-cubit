import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginAppbar extends StatelessWidget {
  const LoginAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      backgroundColor: const Color(0xFF231F20),
      elevation: 0,
      flexibleSpace: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(
              ScalableSize(context).getScalableHeight(25),
            ),
            child: SvgPicture.asset(
              "assets/splash_screen_logo.svg",
              width: ScalableSize(context).getScalableWidth(110),
            ),
          ),
          Container(
            color: const Color(0xFF2B2B2B),
            child: TabBar(
              indicatorPadding: EdgeInsets.only(
                right: ScalableSize(context).getScalableWidth(5.25),
                left: ScalableSize(context).getScalableWidth(5.25),
              ),
              indicatorWeight: ScalableSize(context).getScalableHeight(3),
              indicatorColor: const Color(0xFF71883A),
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              tabs: const [
                Tab(
                  text: "Existing user",
                ),
                Tab(
                  text: "New user",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
