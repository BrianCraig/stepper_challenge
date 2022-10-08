import 'package:flutter/material.dart';

class MyStepperController extends ChangeNotifier {
  MyStepperController(
    this.steps, {
    int initialStep = 0,
  })  : assert(steps > 0),
        assert(initialStep < steps && initialStep >= 0) {
    step = initialStep;
  }

  final int steps;
  int step = 0;

  void goTo(int newStep) {
    assert(newStep < steps && newStep >= 0);
    if (step == newStep) return;
    step = newStep;
    notifyListeners();
  }

  VoidCallback? backCallback() {
    if (step == 0) return null;
    return () => goTo(step - 1);
  }

  VoidCallback? nextCallback() {
    if (step == steps - 1) return null;
    return () => goTo(step + 1);
  }
}

class MyStepper extends StatefulWidget {
  const MyStepper({super.key, required this.controller});

  final MyStepperController controller;

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    super.dispose();
  }

  void _handleControllerChanged() {
    setState(() {});
  }

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
        'Step ${widget.controller.step + 1}',
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
