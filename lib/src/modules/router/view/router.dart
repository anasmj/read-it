import 'package:flutter/material.dart' show BuildContext, Widget;

import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:pattern_m/src/modules/home.dart/view/home.dart';

class AppRouter extends ConsumerWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Home();
}
