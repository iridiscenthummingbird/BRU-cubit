import 'dart:async';

import 'package:bru/screens/login_screen/bloc/login_bloc.dart';
import 'package:bru/screens/login_screen/widgets/hint_text.dart';
import 'package:bru/screens/login_screen/widgets/login_appbar.dart';
import 'package:bru/screens/login_screen/widgets/login_apple_button.dart';
import 'package:bru/screens/login_screen/widgets/login_button.dart';
import 'package:bru/screens/login_screen/widgets/login_facebook_button.dart';
import 'package:bru/screens/login_screen/widgets/login_google_button.dart';
import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginBloc _bloc;

  late StreamController<bool> _streamController;

  @override
  void initState() {
    _streamController = StreamController<bool>.broadcast();
    _bloc = LoginBloc();
    _bloc.stream.listen((event) {
      if (event is LoginToHome) {
        Navigator.pushNamed(context, '/home');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF353535),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                ScalableSize(context).getScalableHeight(207.5),
              ),
              child: const LoginAppbar(),
            ),
            body: TabBarView(
              children: [
                BlocBuilder(
                  bloc: _bloc,
                  builder: (context, state) {
                    if (state is LoginWait) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: ScalableSize(context).getScalableWidth(26),
                          right: ScalableSize(context).getScalableWidth(26),
                        ),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: HintText(
                                    text: "Email",
                                    context: context,
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFDADADA),
                                    border: InputBorder.none,
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    const pattern =
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                    final regExp = RegExp(pattern);
                                    if (!regExp.hasMatch(value)) {
                                      return "Invalid email address";
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: HintText(
                                    context: context,
                                    text: "Password",
                                  ),
                                ),
                                StreamBuilder<bool>(
                                    stream: _streamController.stream,
                                    initialData: false,
                                    builder: (context, snapshot) {
                                      return TextFormField(
                                        controller: _passwordController,
                                        obscureText: !snapshot.data!,
                                        obscuringCharacter: '*',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter password';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFDADADA),
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              _streamController
                                                  .add(!snapshot.data!);
                                            },
                                            icon: Icon(
                                              snapshot.data!
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                              color: const Color(0xFF999999),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                SizedBox(
                                  height: ScalableSize(context)
                                      .getScalableHeight(10),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      "Remind my password",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF71883A),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ScalableSize(context)
                                      .getScalableHeight(40),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _bloc.add(
                                        LoginAuthorization(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          context: context,
                                        ),
                                      );
                                    }
                                  },
                                  child: const LoginButton(),
                                ),
                                SizedBox(
                                  height: ScalableSize(context)
                                      .getScalableHeight(24),
                                ),
                                const LoginFacebookButton(),
                                SizedBox(
                                  height: ScalableSize(context)
                                      .getScalableHeight(18),
                                ),
                                const LoginGoogleButton(),
                                SizedBox(
                                  height: ScalableSize(context)
                                      .getScalableHeight(18),
                                ),
                                const LoginAppleButton(),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const Center(
                  child: Text(
                    "New user",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
