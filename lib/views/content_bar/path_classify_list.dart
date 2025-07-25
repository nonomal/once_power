import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_power/cores/update_name.dart';
import 'package:once_power/providers/file.dart';
import 'package:once_power/providers/list.dart';

class PathClassifyList extends ConsumerWidget {
  const PathClassifyList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> pathList = ref.watch(pathListProvider);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: pathList.length,
      itemBuilder: (context, index) {
        String folder = pathList[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: ref.watch(selectedPathProvider(folder)),
              onChanged: (v) {
                ref.read(fileListProvider.notifier).checkFolder(folder);
                updateName(ref);
              },
            ),
            Expanded(
              child: SelectableText(
                folder,
                maxLines: null,
                style: TextStyle().useSystemChineseFont(),
              ),
            ),
          ],
        );
      },
    );
  }
}
