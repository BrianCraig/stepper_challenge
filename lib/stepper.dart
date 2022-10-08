import 'package:flutter/material.dart';

class MyStepper extends StatelessWidget {
  const MyStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).indicatorColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(4.0),
      width: double.infinity,
      child: Text(
        'Here goes the stepper',
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
