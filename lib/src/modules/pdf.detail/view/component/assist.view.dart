import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/pdf.detail/modules/pdf.content/model/tappable.text.dart';
import 'package:pattern_m/src/modules/pdf.detail/modules/pdf.content/provider/meaning.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/detail.provider.dart';

class AssistView extends ConsumerWidget {
  const AssistView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final meaning = ref.watch(meaningProvider);
    return ref.watch(plainTextProvider).when(
          error: (e, s) {
            return Text('Error: $e');
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (text) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (meaning != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(meaning.en, style: context.text.headlineMedium),
                      Text(meaning.bn, style: context.text.titleMedium),
                    ],
                  ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: TappableText(
                      data: text ?? '',
                      onTap: ref.read(meaningProvider.notifier).getMeaning,
                    ),
                  ),
                ),
              ],
            );
          },
        );
  }
}
