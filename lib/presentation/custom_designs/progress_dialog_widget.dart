import 'package:flutter/material.dart';

class ProgressDialogWidget extends StatelessWidget {
  const ProgressDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
          height: 50,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
