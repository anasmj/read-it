import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home/model/tappable.text.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';

import '../../router/provider/route.provider.dart';
import '../../setting/view/setting.view.dart';

final TextEditingController controller = TextEditingController();

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final plainText = ref.watch(textProvider).text;
    final notifier = ref.read(textProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Home'),
            Text('${ref.watch(textProvider).currentPage}')
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async => await fadePush(context, const SettingView()),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
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
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (ref.watch(textProvider).pdfDoc != null) ...[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: notifier.onPrev,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: notifier.onNext,
            ),
          ],
          FloatingActionButton(
            onPressed: ref.read(textProvider.notifier).pickPDF,
            child: const Icon(Icons.upload),
          )
        ],
      ),
    );
  }
}
