import 'package:animation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import '../common/theme.dart';
import 'package:lottie/lottie.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Flexible(
                flex: 7,
                child: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Flexible(
                      flex: 2,
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Hero(
                          tag: "title",
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: FadeTransition(
                              opacity: curvedAnimation,
                              child: Text(
                                "Movie Covers Collection",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                        fontSize: 35.00,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 7,
                      child: Lottie.asset("assets/movie.json"),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: FractionallySizedBox(
                  widthFactor: 0.85,
                  heightFactor: 0.85,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Hero(
                        tag: "card",
                        child: Container(
                          decoration: decoration,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Create your collection of movie covers",
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Upload and share covers",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // print(Theme.of(context)
                                  //     .backgroundColor
                                  //     .toString());
                                  Navigator.pushNamed(context, "/register");
                                  // Navigator.of(context).push(_createRoute());
                                },
                                child: const Text("GET STARTED"),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const RegisterScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: curve)); // Optional to chain with curve.

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
