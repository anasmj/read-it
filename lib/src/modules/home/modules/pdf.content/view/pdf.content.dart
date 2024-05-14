import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home/modules/pdf.content/model/tappable.text.dart';
import 'package:pattern_m/src/modules/home/modules/pdf.content/provider/meaning.provider.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';

class PdfContent extends ConsumerWidget {
  const PdfContent({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final plainText = ref.watch(pdfProvider).text;
    final meaning = ref.watch(meaningProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meaning?.en ?? '',
              style: context.text.headlineMedium,
            ),
            Text(
              meaning?.bn ?? '',
              style: context.text.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: TappableText(
              data: plainText ?? '',
              onTap: ref.read(meaningProvider.notifier).getMeaning,
            ),
          ),
        ),
      ],
    );
  }
}
// class PdfContent extends ConsumerWidget {
//   const PdfContent({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     final plainText = ref.watch(pdfProvider).text;
//     final meaning = ref.watch(meaningProvider);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   // key: ,
//                   meaning?.en ?? '',
//                   style: context.text.headlineMedium,
//                 ),
//                 Text(
//                   // key: ValueKey(meaning?.en),
//                   meaning?.bn ?? '',
//                   style: context.text.titleMedium,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 6,
//           child: SingleChildScrollView(
//             child: TappableText(
//               data: plainText ?? '',
//               onTap: ref.read(meaningProvider.notifier).getMeaning,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
// }
