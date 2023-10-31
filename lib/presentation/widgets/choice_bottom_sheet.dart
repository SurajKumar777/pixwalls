import 'package:flutter/material.dart';
import 'package:pixwalls/presentation/widgets/custom_button.dart';

import 'custom_text.dart';

class ChoiceBottomSheet extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onLock;
  final VoidCallback onBoth;
  const ChoiceBottomSheet(
      {super.key,
      required this.onHome,
      required this.onLock,
      required this.onBoth});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: <Widget>[
      Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          child: Column(
            children: [
              CustomText(
                text: "Select Screen",
                isBold: true,
                size: 20,
                align: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: onHome,
                    child: CustomButton(
                      text: "Home",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: onLock,
                    child: CustomButton(
                      text: "Lock",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: onBoth,
                    child: CustomButton(
                      text: "Both",
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
