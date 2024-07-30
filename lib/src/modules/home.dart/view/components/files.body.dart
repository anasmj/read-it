import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home.dart/models/opened.file.detail.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/detail.provider.dart';

class FilesBody extends ConsumerWidget {
  const FilesBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recently Opened',
            style: context.text.headlineSmall,
          ),
          Expanded(
            child: ref.watch(usersStreamProvider).when(
                  data: (recentFiles) {
                    return Text('${recentFiles.length}');
                  },
                  error: (e, s) => const Text('err'),
                  loading: () => const Text('Loading'),
                ),
          ),
          // Expanded(
          //   child: GridView.builder(
          //     itemCount: files.length,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: 2 / 1,
          //     ),
          //     itemBuilder: (context, index) =>
          //         FileContainer(detail: files[index]),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FileContainer extends StatelessWidget {
  const FileContainer({super.key, required this.detail});
  final OpenedFileDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      child: Text(
        detail.path!.getLast('/'),
      ),
    );
  }
}
