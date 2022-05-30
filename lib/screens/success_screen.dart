import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animation/common/theme.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final AnimationController controller2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));

    controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500), value: 1);

    controller.forward();

    controller2.addListener(() {
      setState(() {});
      if (controller2.isCompleted) {
        Navigator.pushNamed(context, "/covers");
      }
    });

    controller.addListener(() {
      setState(() {});
      if (controller.isCompleted) {
        controller2.reverse(from: 1);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Spacer(),
              Flexible(
                flex: 8,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Hero(
                    tag: 'title',
                    child: Text(
                      'Movie Covers Collection',
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 30.00,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Flexible(
                flex: 4,
                child: FractionallySizedBox(
                  widthFactor: 0.60,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: controller2.value,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Lottie.asset('assets/complete.json',
                            repeat: false, controller: controller),
                        Hero(
                          tag: 'card',
                          child: Container(
                            width: 0,
                            height: 0,
                            decoration: decoration,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
