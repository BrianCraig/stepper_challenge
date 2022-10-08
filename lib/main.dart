import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper_app/stepper.dart';

const lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in fringilla sapien. Phasellus eget elit sit amet dui mattis porttitor quis ac neque. Proin commodo sit amet nisl non porta. In consequat sollicitudin lacinia. Suspendisse aliquet libero in ante vulputate egestas. Mauris efficitur turpis libero, ac faucibus ligula condimentum at. Donec mollis magna enim, in facilisis leo elementum sit amet. Nulla sagittis magna et velit iaculis mollis. Cras vestibulum congue nunc vel lobortis. Curabitur lacinia, urna varius aliquet consectetur, dui nunc vulputate urna, vel euismod risus erat at velit. Integer tristique laoreet lectus id rhoncus. Vivamus sit amet dolor nec quam vehicula mattis. Vivamus sit amet quam urna.';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MyStepperController(4),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var stepperController = context.watch<MyStepperController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Challenge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Page ${stepperController.step + 1}',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(lorem),
                  const SizedBox(height: 16.0),
                  MyStepper(controller: stepperController),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: stepperController.backCallback(),
                  child: Text("BACK"),
                ),
                Row(
                  children: [
                    for (var i = 0; i < stepperController.steps; i++) i
                  ]
                      .map(
                        (i) => OutlinedButton(
                          onPressed: stepperController.step != i
                              ? () => stepperController.goTo(i)
                              : null,
                          style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size(0, 36)),
                          ),
                          child: Text('${i + 1}'),
                        ),
                      )
                      .toList(),
                ),
                OutlinedButton(
                  onPressed: stepperController.nextCallback(),
                  child: Text("NEXT"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
