import 'package:bru/managers/api_login_manager.dart';
import 'package:bru/managers/api_posts_manager.dart';
import 'package:bru/repository/posts_repository.dart';
import 'package:bru/repository/user_repository.dart';
import 'package:bru/screens/home_screen/home_screen.dart';
import 'package:bru/screens/login_screen/login_screen.dart';
import 'package:bru/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DI(
      child: MaterialApp(
        title: 'BRU',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Sarabun",
        ),
        home: const SplashScreen(),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen()
        },
      ),
    );
  }
}

class DI extends StatelessWidget {
  DI({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IApiLoginManager>(
          create: (context) => ApiLoginManager(),
        ),
        RepositoryProvider<IApiPostsManager>(
          create: (context) => ApiPostsManager(),
        ),
        RepositoryProvider<IUserRepository>(
          create: (context) => UserRepository(
            apiManager: context.read<IApiLoginManager>(),
          ),
        ),
        RepositoryProvider<IPostsRepository>(
          create: (context) => PostsRepository(
            apiPostsManager: context.read<IApiPostsManager>(),
          ),
        )
      ],
      child: child,
    );
  }
}
