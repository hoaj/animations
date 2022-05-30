import 'package:flutter/material.dart';
import 'package:animation/common/theme.dart';

import '../common/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Flexible(
                flex: 6,
                child: Hero(
                  tag: "title",
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
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
              const Spacer(
                flex: 3,
              ),
              Flexible(
                flex: 40,
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
                            "Create your collection \n of movie covers",
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          const CustomFieldForm(hint: "Full name"),
                          const CustomFieldForm(hint: "Mail"),
                          const CustomFieldForm(hint: "Password"),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed((context), "/success");
                            },
                            child: const Text("REGISTER"),
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
}

class CustomFieldForm extends StatelessWidget {
  const CustomFieldForm({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
