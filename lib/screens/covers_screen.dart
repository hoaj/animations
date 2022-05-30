import 'package:flutter/material.dart';

class CoversScreen extends StatefulWidget {
  const CoversScreen({Key? key}) : super(key: key);

  @override
  State<CoversScreen> createState() => _CoversScreenState();
}

class _CoversScreenState extends State<CoversScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Offset> tweenAnimation;
  late final CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);

    tweenAnimation = Tween<Offset>(
      begin: const Offset(0.0, 5.0),
      end: const Offset(0.0, 0.0),
    ).animate(curvedAnimation);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 7,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Hero(
                    tag: "title",
                    child: Text(
                      "Movie Covers Collection",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 30.00,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 30,
                child: SlideTransition(
                  position: tweenAnimation,
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: Scrollbar(
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          50,
                          (index) => MovieCover(colorIndex: index),
                        ),
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 40,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCover extends StatelessWidget {
  const MovieCover({Key? key, required this.colorIndex}) : super(key: key);
  final int colorIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.primaries[colorIndex % Colors.primaries.length],
    );
  }
}
