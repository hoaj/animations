import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animationInt;
  late Animation animationColor;
  late Animation animationColorSequence;
  late Animation animationSize;
  late Animation animationAlignmentFirst;
  late Animation animationAlignmentSecond;
  late CurvedAnimation animationAlignmentCurved;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    animationInt = IntTween(begin: 3, end: 0).animate(controller);

    // Change colors dynamically
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.green).animate(controller);
    animationSize = Tween<double>(begin: 60.0, end: 200.0).animate(controller);

    animationAlignmentFirst =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.center)
            .animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0,
          0.333,
          curve: Curves.ease,
        ),
      ),
    );

    animationAlignmentSecond =
        AlignmentTween(begin: Alignment.center, end: Alignment.bottomCenter)
            .animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.333,
          0.666,
          curve: Curves.ease,
        ),
      ),
    );

    // Change colors based on weight
    animationColorSequence = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(Colors.red), weight: 2),
      TweenSequenceItem(tween: ConstantTween(Colors.yellow), weight: 2),
      TweenSequenceItem(tween: ConstantTween(Colors.green), weight: 1),
    ]).animate(controller);

    controller.repeat();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: controller.value <= 0.333
            ? animationAlignmentFirst.value
            : animationAlignmentSecond.value,
        child: Text(
          animationInt.value != 0 ? animationInt.value.toString() : "GO",
          style: TextStyle(
              color: animationColor.value, fontSize: animationSize.value),
        ),
      ),
    );
  }

  // To be more specific about colors on each number.
  Color pickColor(Animation animationInt) {
    if (animationInt.value >= 2) {
      return Colors.red;
    } else if (animationInt.value == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
