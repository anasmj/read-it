import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home.dart/models/opened.file.detail.dart';

class FileTile extends StatelessWidget {
  const FileTile({super.key, required this.file, this.onPressed});
  final RecentFile file;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 150,
        child: Row(
          children: [
            const SizedBox(
              width: 100,
              child: Placeholder(),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    file.path!.getLast('/'),
                    style: context.text.titleMedium,
                  ),
                  const Text('Another line')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
