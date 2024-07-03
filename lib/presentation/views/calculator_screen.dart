import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dialog_handler_examples/presentation/routes/default_routes.dart';
import 'package:dialog_handler_examples/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../routes/default_app_router.dart';
import '../viewModel/computation_viewmodel.dart';

@RoutePage(name: 'CalculatorScreen')
class CalculatorScreen extends StatefulHookConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  ConsumerState<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends ConsumerState<CalculatorScreen> {
  TextEditingController computationDelayInput =
      TextEditingController(text: "2");
  TextEditingController resultInput = TextEditingController();

  @override
  void dispose() {
    computationDelayInput.dispose();
    resultInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final useComputationViewModelRef = ref.watch(computationViewModelRef);

    var rand = Random();
    int firstDigit = rand.nextInt(100);
    int secondDigit = rand.nextInt(200);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Calculator Task"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'First Digit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        firstDigit.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Second Digit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        secondDigit.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Delay (seconds)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: computationDelayInput,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                          ),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Result',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: resultInput,
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                          ),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () async {
                  resultInput.text = await useComputationViewModelRef.additionOperation(
                    secondsDelay: int.parse(computationDelayInput.text),
                    firstDigit: firstDigit,
                    secondDigit: secondDigit,
                  );
                },
                child: const Text(
                  'Addition Operation',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            locator<DefaultAppRouter>()
                .navigateNamed(DefaultRoutes.dialogExamplesRoute);
          },
          label: const Text(
            "Navigaate To Dialog Examples >",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          isExtended: true,
          autofocus: true,
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
