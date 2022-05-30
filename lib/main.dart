import 'package:animation/screens/covers_screen.dart';
import 'package:flutter/material.dart';
import 'package:animation/screens/launch_screen.dart';
import 'package:animation/common/theme.dart';
import 'package:animation/screens/register_screen.dart';
import 'package:animation/screens/success_screen.dart';
import 'package:animation/screens/TestPage.dart';

void main() => runApp(const AnimationApp());

class AnimationApp extends StatelessWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const LaunchScreen(),
        '/register': (context) => const RegisterScreen(),
        '/success': (context) => const SuccessScreen(),
        '/covers': (context) => const CoversScreen(),
        '/test': (context) => const TestPage(),
      },
    );
  }
}
