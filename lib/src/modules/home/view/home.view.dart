import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';

import '../../router/provider/route.provider.dart';
import '../../setting/view/setting.view.dart';

final TextEditingController controller = TextEditingController();

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final words = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
                child: Wrap(
                  children: List.generate(
                    words.length,
                    (index) => GestureDetector(
                      onTap: () => print(words[index]),
                      child: Text('${words[index]} '),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(textProvider.notifier).pickPDFText,
        child: const Icon(Icons.upload),
      ),
    );
  }
}
