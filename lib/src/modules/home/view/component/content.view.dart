import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home/model/tappable.text.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';

class ContentView extends ConsumerWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final plainText = ref.watch(pdfProvider).text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          'Defination',
          style: context.text.headlineMedium,
        )),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: TappableText(
              data: plainText ?? '',
              onTap: (s) {
                print(s);
              },
            ),
          ),
        ),
      ],
    );
  }
}
