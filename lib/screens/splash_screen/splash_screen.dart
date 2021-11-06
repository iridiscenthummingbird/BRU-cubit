import 'package:bru/screens/splash_screen/bloc/splash_bloc.dart';
import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc _bloc;
  @override
  void initState() {
    _bloc = SplashBloc();
    _bloc.add(OnSplashStarted());
    _bloc.stream.listen((state) {
      if (state is SplashOpenLogin) {
        Navigator.pushNamed(context, '/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF353535),
      body: Center(
        child: SvgPicture.asset(
          "assets/splash_screen_logo.svg",
          width: ScalableSize(context).getScalableWidth(262),
        ),
      ),
    );
  }
}
