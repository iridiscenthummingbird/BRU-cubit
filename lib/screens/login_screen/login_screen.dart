import 'package:bru/screens/login_screen/widgets/login_appbar.dart';
import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF353535),
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(ScalableSize(context).getScalableHeight(226)),
            child: const LoginAppbar(),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("Login")),
              Center(child: Text("New")),
            ],
          ),
        ),
      ),
    );
  }
}
