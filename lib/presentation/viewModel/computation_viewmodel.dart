import 'package:dialog_handler/dialog_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/locator.dart';
import '../custom_designs/__export__.dart';
import '../custom_designs/progress_dialog_widget.dart';

final computationViewModelRef =
    ChangeNotifierProvider<ComputationViewModel>((ref) {
  return ComputationViewModel(reader: ref);
});

class ComputationViewModel extends ChangeNotifier {
  late Ref reader;

  ComputationViewModel({
    required this.reader,
  });

  Future<String> additionOperation({
    required int secondsDelay,
    required int firstDigit,
    required int secondDigit,
  }) async {
    try {
      /// Show Progress Dialog
      locator<DialogHandler>().showDialog(
        dialogType: DialogType.overlayDialog,
        widget: const ProgressDialogWidget(),
        backgroundWidget: GlassContainer.clearGlass(
          borderWidth: 0,
          blur: 7,
        ),
      );

      /// Perform Operation
      final result = firstDigit + secondDigit;

      await Future.delayed(
        Duration(seconds: secondsDelay),
      );
      locator<DialogHandler>().dismissDialog();

      return result.toString();
    } catch (e) {
      /// Show Progress Dialog
      locator<DialogHandler>().showDialog(
        dialogType: DialogType.overlayDialog,
        animationType: AnimationType.fromTopToPositionThenBounce,
        dialogAlignment: Alignment.topCenter,
        animationDuration: const Duration(milliseconds: 1200),
        animationReverseDuration: const Duration(milliseconds: 550),
        widget: const ErrorDialogWidgetExample(),
        autoDismissalDuration: const Duration(seconds: 2),
      );
      return "error";
    }
  }
}
