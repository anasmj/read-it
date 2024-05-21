import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/mode.provider.dart';

class ToggleModeButton extends ConsumerWidget {
  const ToggleModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(modeProvider);
    final notifier = ref.watch(modeProvider.notifier);

    return TextButton(
      onPressed: notifier.toggleMode,
      child: Text(mode == ReadMode.normal ? 'Assist' : 'Normal'),
    );
  }
}
