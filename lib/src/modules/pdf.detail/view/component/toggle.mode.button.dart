import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pattern_m/src/modules/pdf.detail/provider/detail.provider.dart';

class ToggleModeButton extends ConsumerWidget {
  const ToggleModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(readModeProvider);
    final notifier = ref.watch(readModeProvider.notifier);

    return TextButton(
      onPressed: notifier.toggleMode,
      child: Text(mode == Mode.normal ? 'Assist' : 'Normal'),
    );
  }
}
